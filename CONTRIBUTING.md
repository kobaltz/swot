# Contributing to Swot

##### Updating the database

https://github.com/jetbrains/swot is the canonical source of truth for the list of domains.
If you want to add a new domain, please submit a pull request there. This database is updated
periodically based on the information in that repository.

##### What will not be accepted

Any pull request that is touching the `lib/domains` directory will be
rejected. This is because the contents of that directory are automatically generated
from the canonical source of truth.

##### What will be accepted

A pull request that improves the parsing functionality or adds new features to the
gem will be accepted. Please make sure to include tests for any new functionality.
