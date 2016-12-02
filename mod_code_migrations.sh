#!/usr/bin/env bash
source ./forest.conf
#Code of post-compose.sh

function migrate()
{
        local sandbox_name="$1"
        if [ -z "$sandbox_name" ]; then
	    echo "err: (migrate) sandbox name is empty"
            return 1
        fi

	docker exec -it ${sandbox_name}_debian8_phpfpm56 chmod -R 777 /data/www/site/current/

}

migrate "sandbox_10"
