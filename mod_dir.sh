#!/usr/bin/env bash
source ./forest.conf
#Code of mod_git.sh

create_dir() 
{
	local newdir_name="$1"
	
	if [ ! -z "$newdir_name" ] && [ ! -d "$newdir_name" ]; then
    	mkdir -p "$newdir_name"
    fi

    if [ $? != 0 ]; then
        echo "cant create dir $newdir_name" 
        return 1
    fi
}

read_config()
{
	local config_file="$1"
	echo "$(cat $config_file)"

	return $?
}

write_config()
{
	local config_file="$1"
	local text="$2"
	echo "$2" > "$1" #TODO , why this is working insted >>

	return $?
}

rename()
{
	local original="$1"
	local copy="$2"
	copy "$original" "$copy"

	return $?
}

copy()
{
	local original="$1"
	local copy="$2"
	
	if [ ! -z "$original" ] && [ ! -z "$copy" ]; then
		cp -R "$original" "$copy"
	fi

	if [ $? != 0 ]; then
		echo "cant copy file $original"
		return 1
	fi

}

delete()
{
	local kill_dirname="$1"
	
	if [ ! -z "$kill_dirname" ] && [ -d "$kill_dirname" ]; then
		sudo rm -rf "$kill_dirname" #TODO is it SAFE ?????
    fi

    if [ $? != 0 ]; then
        echo "cant delete dir $kill_dirname" 
    	return 1
    fi
}

return_to_root()
{
	cd "$conf_dir_main"
}

init_repo_dir()
{
	if [ ! -d "$conf_git_repo_dir" ]; then
		mkdir -p "$conf_git_repo_dir"
		if [ $? != 0 ]; then
			return 1
		fi
	fi	
}

copy_repo_to_sandbox()
{
	return_to_root
	delete "$sandbox_name/$conf_git_repo_name"
	if [ -d "$conf_git_repo_dir/$conf_git_repo_name" ] && [ -d "$sandbox_name" ]; then
    	copy "$conf_git_repo_dir/$conf_git_repo_name" "$sandbox_name/$conf_git_repo_name"
    else
    	echo "err: there isnt any code to copy from projects folder to current sandbox"
    	return 1
    fi

    return $?
}
