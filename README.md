# VLINGO XOOM PLATFORM SDK

[![Build](https://github.com/vlingo/vlingo-platform/workflows/Release/badge.svg)](https://github.com/vlingo/vlingo-platform/actions?query=workflow%3ARelease) [![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/vlingo-platform-java/community)

Use the VLINGO XOOM OSS platform SDK for rapid delivery of low-code to full-code Reactive, Event-Driven Microservices and Applications using DOMA, DDD, and other approaches.

Docs: https://docs.vlingo.io/

[Official VLINGO XOOM website](https://vlingo.io/).

## Getting started

Prerequisites:
* Java JDK 8 or greater

## Maintaining the Libraries

### Release process

See [RELEASE_HOW_TO](RELEASE_HOW_TO.md) for the release process.

### Build configuration

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

In our [examples repository](https://github.com/vlingo/vlingo-examples) you have an example of how to deploy two services working together.

## Snapshots repository

VLINGO snapshots are published to [GitHub Packages](https://github.com/vlingo/vlingo-platform/packages).

All VLINGO libraries are configured to use GitHub Packages for snapshots:

```xml
<project>
  <!-- ... -->
  <repositories>
    <repository>
      <id>github</id>
      <url>https://maven.pkg.github.com/vlingo/vlingo-platform</url>
      <snapshots><enabled>true</enabled></snapshots>
    </repository>
  </repositories>
  <pluginRepositories>
    <pluginRepository>
      <id>github</id>
      <url>https://maven.pkg.github.com/vlingo/vlingo-platform</url>
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
Copyright © 2012-2020 VLINGO LABS. All rights reserved.

This Source Code Form is subject to the terms of the
Mozilla Public License, v. 2.0. If a copy of the MPL
was not distributed with this file, You can obtain
one at https://mozilla.org/MPL/2.0/.
