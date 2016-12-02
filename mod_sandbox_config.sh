#!/usr/bin/env bash
source ./forest.conf
source ./mod_sandbox_pool.sh
source ./mod_dir.sh
source ./mod_text.sh
#Code of mod_pod_config_preprocess.sh

# TODO refactor on two functions
# put registry ips etc. into the docker-compose.yml
sandbox_config_create()
{
	local sandbox_name="$1"
    local new_config_file_path="docker-compose.yml" 
    # local docker_compose_config_dir

    check_sandbox_name "$sandbox_name" > /dev/null
    chek_is_err
    create_dir "$sandbox_name"
    chek_is_err 
    copy "$conf_docker_compose_template" "$sandbox_name/$new_config_file_path"

    return $?
}

sandbox_config_init_placeholders()
{
	local sandbox_name="$1"
	local sandbox_ip="$2"
	local config_file="$3"
        # because of - sed - we should to escape special chars (slashes)  
        local sandbox_code_dir="$conf_dir_main/$sandbox_name/$conf_git_repo_name"
	local config_content
	local result

    #TODO move this IPs to config
	config_content=$(read_config $config_file)
	result=$(replace_text "$config_content" "{sandbox_ip}" "$sandbox_ip")
	write_config "$config_file" "$result"

	config_content=$(read_config $config_file)
	result=$(replace_text "$config_content" "{docker_registry_ip_port}" "$conf_docker_registry")
	write_config "$config_file" "$result"

	config_content=$(read_config $config_file)
	result=$(replace_text "$config_content" "{sandbox_name}" "$sandbox_name")
	write_config "$config_file" "$result"

	config_content=$(read_config $config_file)
	result=$(replace_text "$config_content" "{sandbox_code_dir}" "$sandbox_code_dir")
	write_config "$config_file" "$result"

	return $?
}


