#!/usr/bin/env bash
source ./forest.conf
source ./mod_dir.sh
source ./helpers.sh
#Code of cli_sandbox_startcompose.sh


sandbox_name="$1"
if [ -z "$sandbox_name" ]; then
	echo "err: sandbox name undefined"
	return 1
fi

code_ver="$2"
if [ -z "$code_ver" ]; then
	code_ver="master"
fi

# Bootstrap sandbox
return_to_root && source ./mod_sandbox_config.sh
if [ -d "$sandbox_name" ]; then
	./cli_sandbox_destroy.sh "$sandbox_name"
fi

echo "START sandbox"
return_to_root
sandbox_config_create "$sandbox_name" chek_is_err
sandbox_config_init_placeholders "$sandbox_name" "$sandbox_name/$conf_config_file_name" chek_is_err

# Bootstrap code - repo, configs, 3rd party, migrations
return_to_root && source ./mod_git.sh
init_repo_dir;						  chek_is_err
cd "$conf_git_repo_dir"
get_code "$code_ver";                 chek_is_err
return_to_root 
copy_repo_to_sandbox;                 chek_is_err

# DOCKER-COMPOSE UP
return_to_root && source ./mod_code_bootstrap.sh
copy "configs/code_config.yml" "$sandbox_name/config.yml" chek_is_err
cd "$sandbox_name"
# 3rd party - composer.phar install .. npm install ..
#install_libraries
###docker-compose up -d
chek_is_err

# Migrate
return_to_root && source ./mod_code_migrations.sh
#migrate                               chek_is_err




