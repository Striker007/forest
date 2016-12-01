#!/usr/bin/env bash
source ./forest.conf
#Code of post-compose.sh

function migrate()
{
	docker exec -it sandbox1_debian8_mongodb30 mongo --eval "printjson(rs.initiate())"

	sleep 10
	#docker exec -it sandbox1_debian8_mongodb30 mongorestore /data/www/site/current/docker/dump2
}
