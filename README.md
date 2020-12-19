# VLINGO/PLATFORM

[![Build](https://github.com/vlingo/vlingo-platform/workflows/Release/badge.svg)](https://github.com/vlingo/vlingo-platform/actions?query=workflow%3ARelease) [![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/vlingo-platform-java/community)

The VLINGO/PLATFORM central "build all" and other control.

Docs: https://docs.vlingo.io/

[Official VLINGO/PLATFORM website](https://vlingo.io/).

[Read about the VLINGO/PLATFORM](https://docs.vlingo.io/) and about [its architecture](https://docs.vlingo.io/architecture).


## Getting started

Prerequisites:
* Java JDK 8 or greater
* Docker & docker-compose

## Maintaining the Libraries

### Synchronizing Library Versions

- see [build.gradle](build.gradle) for the list of repos, versions and replacement regexes
- adjust the config
- if the directories are checked out already next to this repo, make sure, the right branches (`master`) are checked out, and all changes are committed
- run `gradle` or `./gradlew`
- alternatively, run `gradle syncVersions` without checking out automatically
- review and commit the repos

### Travis to Bintray

Create a `.travis.yml` file with build statements. You must create a `deploy.key` in this file using the following command-line tool:

```
travis encrypt <YOUR BINTRAY API KEY> --add deploy.key
```
You get your Bintray API key from your Bintray user user profile:

```
  Username-drop-menu > Edit Profile > API Key (left bar menu)
```

### Creating a New Travis Build Push to Bintray Package

- Repository Settings for Travis
-- Example: https://travis-ci.org/github/vlingo/vlingo-xoom/settings
-- `BINTRAY_USERNAME` - Your Bintray user account name
-- `BINTRAY_PASSWORD` - Your Bintray user **API Key**, **NOT** your Bintray user account password
-- `GITHUB_TOKEN` - Use the token on the VLINGO org


## Deployment to Pivotal Cloud Foundry

You can refer to [this link](PivotalCloudFoundry/DEPLOY.md) to read the documentation about how to deploy to Pivotal Cloud Foundry platform.

In our [examples repository](https://github.com/vlingo/vlingo-examples) you have an example of how to deploy two services working together.


License (See LICENSE file for full license)
-------------------------------------------
Copyright © 2012-2020 VLINGO LABS. All rights reserved.

This Source Code Form is subject to the terms of the
Mozilla Public License, v. 2.0. If a copy of the MPL
was not distributed with this file, You can obtain
one at https://mozilla.org/MPL/2.0/.
