#!/usr/bin/env bash
source ./forest.conf
source ./mod_dir.sh
#Code of mod_git.sh

# AHTUNG you should CD to code dir



get_code()
{
	if [ ! -d "$conf_git_repo_name" ]; then
		git_clone
	else
		git_checkout_pull "$1" #TODO check
	fi

	return $?
}

git_branches()
{
	if [ -d "$conf_git_repo_dir" ]; then
		cd "$conf_git_repo_dir" && echo "$(git branch -a)"
	fi

	return $?
}

git_clone()
{
	if [ ! -d "$conf_git_repo_name" ]; then
	    su ci << EOF
            git clone "$conf_git_repo"
EOF
	else 
	    echo "err: dir with code already exists"
    	    return 1
	fi
}

git_checkout_pull()
{
	local ver="$1"

	if [ -z "$ver" ]; then
	su ci << 'EOF'
		git checkout master
EOF
	else
	su ci << 'EOF'
		git checkout "$ver"
EOF
	fi

	if [ $? != 0 ]; then 
		echo 'Repo wasnt cloned'
		return 1
	fi
}
