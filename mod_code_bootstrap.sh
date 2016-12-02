#!/usr/bin/env bash
source ./forest.conf
#Code of mod_code_bootstrap.sh

function install_libraries()
{
        sudo chown -R ci:ci . 
	su ci << EOF
	php composer.phar config secure-http false
	php composer.phar config store-auths false
	php composer.phar install -o --no-dev
	cd concatinator
	npm i
	npm prune
	npm run build:prod
EOF
}

