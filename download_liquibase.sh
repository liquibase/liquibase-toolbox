#!/bin/bash
VERSION=$(curl -s https://github.com/liquibase/liquibase/releases/latest | grep -o "v.*" | sed s/'>.*'//g |  sed s/'v'//g | sed 's/"//g')
VERSION="${1:-"$VERSION"}"
curl -L https://github.com/liquibase/liquibase/releases/download/v${VERSION}/liquibase-${VERSION}.zip --output liquibase-${VERSION}.zip
unzip -o -d liquibase-${VERSION} liquibase-${VERSION}.zip
