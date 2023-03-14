deploy_info = {
  "sha" => "Unknown SHA",
  "branch" => "Unknown branch",
  "last_deployed" => "Not in deployed environment"
}
if File.exist?('deploy_info.json')
  deploy_info.merge!(JSON.parse(File.read('deploy_info.json')))
end

GIT_SHA =
    if Rails.env.production?
      deploy_info["sha"]
    elsif Rails.env.development? || Rails.env.test?
      `git rev-parse HEAD`.chomp
    else
      "Unknown SHA"
    end
    
BRANCH =
    if Rails.env.production?
      deploy_info["branch"]
    elsif Rails.env.development? || Rails.env.test?
      `git rev-parse --abbrev-ref HEAD`.chomp
    else
      "Unknown branch"
    end

LAST_DEPLOYED =
    if Rails.env.production?
      DateTime.parse(deploy_info["last_deployed"]).strftime("%e %b %Y %H:%M:%S")
    else
      "Not in deployed environment"
    end

HYRAX_VERSION =
    if File.exist?('Gemfile.lock')
      version_match = `grep 'hyrax (' Gemfile.lock`
      version_match.present? ? version_match.lines.first.chomp.lstrip.split(/ /)[1].gsub('(','').gsub(')','') : "Unknown"
    else
      "Unknown"
    end

HYRAX_BRANCH =
    if File.exist?('Gemfile.lock')
      branch_match = `grep branch: Gemfile.lock || grep ref: Gemfile.lock`
      branch_match.present? ? branch_match.lines.first.chomp.lstrip.split(/ /)[1] : nil
    else
      "Unknown"
    end

HYRAX_BRANCH_REVISION =
    if File.exist?('Gemfile.lock')
      revision_match = `grep revision: Gemfile.lock`
      revision_match.present? ? revision_match.lines.first.chomp.lstrip.split(/ /)[1] : nil
    else
      "Unknown"
    end
