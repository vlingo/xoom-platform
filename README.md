# vlingo-platform

[![Build Status](https://travis-ci.org/vlingo/vlingo-platform.svg?branch=master)](https://travis-ci.org/vlingo/vlingo-platform) [![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/vlingo-platform-java/community)

The VLINGO/PLATFORM central "build all" and other control.

Docs: https://docs.vlingo.io/

[Official vlingo/platform website](https://vlingo.io/).

[Read about the vlingo/platform](https://kalele.io/blog-posts/vlingo-platform/) and about [its architecture](https://kalele.io/blog-posts/vlingo-platform-architecture-part1/).


## Getting started

Prerequisites:
* Java JDK 8
* Docker & docker-compose

To check out all `vlingo-platform` modules, ...
* ... create a parent directory to hold all your `vlingo` repos
* ... `cd` into the new repo
* ... run `./gradlew` to clone all module repositories

To build the complete platform ...
* ... start a PostgreSQL DB container (`vlingo-symbio-jdbc`) by running `cd ../vlingo-symbio-jdbc && ./pgbounce.sh && cd ../vlingo-platform`
* ... start a RabbitMQ container (`vlingo-lattice-exchange-rabbitmq`):  `cd ../vlingo-lattice-exchange-rabbitmq && ./rmqbounce.sh && cd ../vlingo-platform`
* ... run `./mvnw clean install` to run all tests and build all artifacts

So, to check out and build all `vlingo-platform modules`, do the following:

```
$ cd <my-projects-root-directory>
$ mkdir vlingo
$ cd vlingo
$ git clone git@github.com:vlingo/vlingo-platform.git
$ cd vlingo-platform
$ ./gradlew
$ cd ../vlingo-symbio-jdbc && ./pgbounce.sh && cd ../vlingo-platform
$ cd ../vlingo-lattice-exchange-rabbitmq && ./rmqbounce.sh && cd ../vlingo-platform
$ ./mvnw clean install
```

Note that the tests of the experimental `vlingo-symbio-foundationdb` module are currently skipped in the platform build. 
Please refer to its README for building and testing details.

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
