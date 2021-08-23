#!/bin/bash
VERSION=$(curl -s https://github.com/liquibase/liquibase/releases/latest | grep 
curl -L https://github.com/liquibase/liquibase/releases/download/v${VERSION}/liq
unzip -o -d liquibase-${VERSION} liquibase-${VERSION}.zip
