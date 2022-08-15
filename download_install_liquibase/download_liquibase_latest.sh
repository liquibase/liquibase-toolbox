#!/bin/bash
VERSION="$(curl  -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/liquibase/liquibase/releases/latest | grep -o "v.*" | grep -v "\"\," | grep "core.*jar" | sed s/"v"//g | sed s/"\/.*"//g)"
curl -L https://github.com/liquibase/liquibase/releases/download/v${VERSION}/liquibase-${VERSION}.zip --output liquibase-${VERSION}.zip
unzip -o -d liquibase-${VERSION} liquibase-${VERSION}.zip
