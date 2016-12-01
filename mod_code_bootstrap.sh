#!/usr/bin/env bash
source ./forest.conf
#Code of mod_code_bootstrap.sh


function install_libraries()
{
	#su ci << 'EOF'
	php composer.phar config secure-http false
	php composer.phar config store-auths false
	php composer.phar install -o --no-dev

	cd /data/docker_sandbox_1/site/concatinator/
	npm i
	npm prune
	npm run build:prod
#EOF
}

