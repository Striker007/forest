# run Forest run ..

## Forest the container management platform that makes everything (about) easy.

> **Note:**
Made with love )

requirment
- linux system
- docker engine
- docker-compose
>

_You can use Forest in the following steps:_

- setup forest.conf
- run bootstrap.sh
  next scripts will be run
  - pre-compose.sh (pull of repo)
  - compose.sh (docker compose)
  - post-compose.sh (migrations) snippets (the snippet must be named with a `.md` extension)
