# nurax-pg

This is an application used for testing the state of [Hyrax](https://github.com/samvera/hyrax) 
using Postgres as the metadata store for objects.  In this application, Fedora is 
not used for storing object metadata or files. The `main` branch is pinned to Hyrax
`main`.

## Known Issues

Collection model
* `/app/models/collection.rb` - is_a `ActiveFedora::Base`
* if `Collection` is changed to `Valkyrie::Resource`, there is an infinite loop while loading due to reference to ::Collection in `lib/hyrax/collection_name.rb` in the hyrax engine 

Default Admin Set
* creating an admin set as a `Valkyrie::Resource` fails to save ACLs.  This is a known issue in Hyrax.  See [Hyrax Issue #5108](https://github.com/samvera/hyrax/issues/5108).

## Questions

Please direct questions about this code or the servers where it runs to the `#nurax` channel on Samvera slack.
