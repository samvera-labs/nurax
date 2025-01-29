FROM ruby:3.3-bookworm

ARG RAILS_ENV

# Necessary for bundler to operate properly
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# --allow-unauthenticated needed for yarn package
RUN apt-get update && apt-get upgrade -y && \
  apt-get install --no-install-recommends -y ca-certificates nodejs yarn \
  build-essential libpq-dev libreoffice imagemagick unzip ghostscript vim \
  ffmpeg mediainfo libjemalloc2 \
  clamav-freshclam clamav-daemon libclamav-dev \
  libqt5webkit5-dev xvfb xauth default-jre-headless --fix-missing --allow-unauthenticated

# fetch clamav local database
# initial update of av databases
RUN freshclam

# install FITS for file characterization
RUN mkdir -p /opt/fits && \
    curl -fSL -o /opt/fits/fits-1.6.0.zip https://github.com/harvard-lts/fits/releases/download/1.6.0/fits-1.6.0.zip && \
    cd /opt/fits && unzip fits-1.6.0.zip && chmod +X fits.sh && \
    rm fits-1.6.0.zip tools/mediainfo/linux/libmediainfo.so.0 tools/mediainfo/linux/libzen.so.0 && \
    sed -i 's/\(<tool.*TikaTool.*>\)/<!--\1-->/ ; s/\(<tool.*FFIdent.*>\)/<!--\1-->/' xml/fits.xml && \
    cd /etc/ImageMagick-6 ; sed -i 's/\(<policy.*none.*PDF.*>\)/<!--\1-->/' policy.xml

# Increase stack size limit to help working with large works
ENV PATH=/opt/fits:$PATH \
    RUBY_THREAD_MACHINE_STACK_SIZE=8388608 \
    RUBY_THREAD_VM_STACK_SIZE=8388608 \
    LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.2

RUN gem update --system

RUN mkdir /data
WORKDIR /data

ARG HYRAX_TARGET=main
ENV HYRAX_TARGET=$HYRAX_TARGET

# Pre-install gems so we aren't reinstalling all the gems when literally any
# filesystem change happens
ADD Gemfile /data
ADD Gemfile.lock /data
RUN mkdir /data/build
ADD ./build/install_gems.sh /data/build
RUN ./build/install_gems.sh

# Add the application code
RUN mv Gemfile.lock Gemfile.lock.build
ADD . /data
RUN mv Gemfile.lock.build Gemfile.lock

# install node dependencies, after there are some included
RUN yarn install

# precopile assets in production
RUN ./build/build_assets.sh

ENTRYPOINT ["/data/bin/container_boot"]
CMD []
