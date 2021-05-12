# VLINGO XOOM PLATFORM SDK

[![Build](https://github.com/vlingo/xoom-platform/workflows/Release/badge.svg)](https://github.com/vlingo/xoom-platform/actions?query=workflow%3ARelease) [![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/vlingo-platform-java/community)

[![xoom-common](https://github.com/vlingo/xoom-common/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-common/actions?query=workflow%3ABuild)
[![xoom-actors](https://github.com/vlingo/xoom-actors/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-actors/actions?query=workflow%3ABuild)
[![xoom-wire](https://github.com/vlingo/xoom-wire/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-wire/actions?query=workflow%3ABuild)
[![xoom-streams](https://github.com/vlingo/xoom-streams/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-streams/actions?query=workflow%3ABuild)
[![xoom-streams-tck](https://github.com/vlingo/xoom-streams-tck/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-streams-tck/actions?query=workflow%3ABuild)
[![xoom-http](https://github.com/vlingo/xoom-http/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-http/actions?query=workflow%3ABuild)
[![xoom-cluster](https://github.com/vlingo/xoom-cluster/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-cluster/actions?query=workflow%3ABuild)
[![xoom-graphql](https://github.com/vlingo/xoom-graphql/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-graphql/actions?query=workflow%3ABuild)
[![xoom-codegen](https://github.com/vlingo/xoom-codegen/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-codegen/actions?query=workflow%3ABuild)
[![xoom-directory](https://github.com/vlingo/xoom-directory/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-directory/actions?query=workflow%3ABuild)
[![xoom-auth](https://github.com/vlingo/xoom-auth/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-auth/actions?query=workflow%3ABuild)
[![xoom-symbio](https://github.com/vlingo/xoom-symbio/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-symbio/actions?query=workflow%3ABuild)
[![xoom-symbio-dynamodb](https://github.com/vlingo/xoom-symbio-dynamodb/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-symbio-dynamodb/actions?query=workflow%3ABuild)
[![xoom-symbio-geode](https://github.com/vlingo/xoom-symbio-geode/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-symbio-geode/actions?query=workflow%3ABuild)
[![xoom-symbio-jdbc](https://github.com/vlingo/xoom-symbio-jdbc/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-symbio-jdbc/actions?query=workflow%3ABuild)
[![xoom-lattice](https://github.com/vlingo/xoom-lattice/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-lattice/actions?query=workflow%3ABuild)
[![xoom-lattice-exchange-camel](https://github.com/vlingo/xoom-lattice-exchange-camel/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-lattice-exchange-camel/actions?query=workflow%3ABuild)
[![xoom-lattice-exchange-rabbitmq](https://github.com/vlingo/xoom-lattice-exchange-rabbitmq/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-lattice-exchange-rabbitmq/actions?query=workflow%3ABuild)
[![xoom-turbo](https://github.com/vlingo/xoom-turbo/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-turbo/actions?query=workflow%3ABuild)
[![xoom-designer](https://github.com/vlingo/xoom-designer/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-designer/actions?query=workflow%3ABuild)
[![xoom-schemata](https://github.com/vlingo/xoom-schemata/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-schemata/actions?query=workflow%3ABuild)
[![xoom-build-plugins](https://github.com/vlingo/xoom-build-plugins/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-build-plugins/actions?query=workflow%3ABuild)
[![xoom-build-plugins-test](https://github.com/vlingo/xoom-build-plugins-test/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-build-plugins-test/actions?query=workflow%3ABuild)
[![xoom-telemetry](https://github.com/vlingo/xoom-telemetry/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-telemetry/actions?query=workflow%3ABuild)
[![xoom-examples](https://github.com/vlingo/xoom-examples/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-examples/actions?query=workflow%3ABuild)
[![xoom-helloworld](https://github.com/vlingo/xoom-helloworld/workflows/Build/badge.svg)](https://github.com/vlingo/xoom-helloworld/actions?query=workflow%3ABuild)

Use the VLINGO XOOM OSS platform SDK for rapid delivery of low-code to full-code Reactive, Event-Driven Microservices and Applications using DOMA, DDD, and other approaches.

Docs: https://docs.vlingo.io/

[Official VLINGO XOOM website](https://vlingo.io/).

## Getting started

Prerequisites:
* Java JDK 8 or greater
* [GraalVM 21.1.0 Java 8/11](https://www.graalvm.org/docs/getting-started/)

## Maintaining the Libraries

### Release process

See [RELEASE_HOW_TO](RELEASE_HOW_TO.md) for the release process.

### Local builds

To build all platform modules locally, clone all the modules (or pull the latest changes),
and execute the `install` phase with the `modules` profile activated:

```bash
./pull.sh
mvn clean install -Pmodules
```
### GraalVM builds

```bash
mvn clean install -Pmodules -Pnative-image
```
More details [GraalVM](GraalVM.md)

### CI build configuration

- GitHub Organisation secrets
  - `RELEASE_GITHUB_TOKEN` - Use the token on the VLINGO org
  - `DEPLOY_GITHUB_TOKEN` - GitHub token for publishing to GitHub packages
  - `MAVEN_GPG_PRIVATEKEY` - gpg key used to sign Maven packages
  - `MAVEN_GPG_PASSPHRASE` - password for the gpg key
  - `OSSRH_USERNAME` - username for the Sonatype OSSRH Maven repository
  - `OSSRH_TOKEN` - password for the Sonatype OSSRH Maven repository
  - `SLACK_WEBHOOK` - Webhook for slack notifications, can be generated [here](https://slack.com/apps/A0F7XDUAZ-incoming-webhooks)

## Deployment to Pivotal Cloud Foundry

You can refer to [this link](PivotalCloudFoundry/DEPLOY.md) to read the documentation about how to deploy to Pivotal Cloud Foundry platform.

In our [examples repository](https://github.com/vlingo/xoom-examples) you have an example of how to deploy two services working together.

## Snapshots repository

VLINGO snapshots are published to both [Sonatype](https://oss.sonatype.org/content/repositories/snapshots/io/vlingo/xoom/) and [GitHub Packages](https://github.com/vlingo/xoom-platform/packages).

All VLINGO libraries are configured to use Sonatype for snapshots:

```xml
<project>
  <!-- ... -->
  <repositories>
    <repository>
      <id>ossrh-snapshots</id>
      <url>https://oss.sonatype.org/content/repositories/snapshots/</url>
      <releases><enabled>false</enabled></releases>
      <snapshots><enabled>true</enabled></snapshots>
    </repository>
  </repositories>
  <pluginRepositories>
    <pluginRepository>
      <id>ossrh-snapshots</id>
      <url>https://oss.sonatype.org/content/repositories/snapshots/</url>
      <releases><enabled>false</enabled></releases>
      <snapshots><enabled>true</enabled></snapshots>
    </pluginRepository>
  </pluginRepositories>
</project>
```

Snapshots can also be installed from GitHub Packages:

```xml
<project>
  <!-- ... -->
  <repositories>
    <repository>
      <id>github</id>
      <url>https://maven.pkg.github.com/vlingo/xoom-platform</url>
      <snapshots><enabled>true</enabled></snapshots>
    </repository>
  </repositories>
  <pluginRepositories>
    <pluginRepository>
      <id>github</id>
      <url>https://maven.pkg.github.com/vlingo/xoom-platform</url>
      <snapshots><enabled>true</enabled></snapshots>
    </pluginRepository>
  </pluginRepositories>
</project>
```

GitHub [requires authentication with a Personal Access Token](https://docs.github.com/en/packages/guides/configuring-apache-maven-for-use-with-github-packages#authenticating-with-a-personal-access-token)
to use their Maven repository.
In order to build VLINGO libraries locally, you will need to configure the following in your `~/.m2/settings.xml`:

```xml
<settings>
  <servers>
    <server>
      <id>github</id>
      <username>GITHUB-USERNAME</username>
      <password>GITHUB-PERSONAL-ACCESS-TOKEN</password>
    </server>
  </servers>
</settings>
```

Replace `GITHUB-USERNAME` with your GitHub username, and `GITHUB-PERSONAL-ACCESS-TOKEN` with your Personal Access Token.
Personal Access Tokens can be created in Settings > Developer Settings > [Personal Access Tokens](https://github.com/settings/tokens) on GitHub.
Remember to create the token with `read:packages` scope.

License (See LICENSE file for full license)
-------------------------------------------
Copyright © 2012-2021 VLINGO LABS. All rights reserved.

This Source Code Form is subject to the terms of the
Mozilla Public License, v. 2.0. If a copy of the MPL
was not distributed with this file, You can obtain
one at https://mozilla.org/MPL/2.0/.
