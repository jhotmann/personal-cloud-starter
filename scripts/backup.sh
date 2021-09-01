#!/bin/bash

set -e

# change to wherever you want backup files to live
BACKUP_ROOT=/backup
NOW=$( date '+%Y%m%d' )

# backup_volumes container_name volume1 volume2...
backup_volumes() {
  local current_app=$1
  shift

  echo "Backing up ${current_app}"

  docker-compose stop $current_app
  mkdir -pv $BACKUP_ROOT/${current_app}

  for epilogue in "$@"
  do
    echo "docker run -v ${current_app}_${epilogue}:/volume -v $BACKUP_ROOT/${current_app}:/backup --rm loomchild/volume-backup backup '${NOW}_${current_app}_${epilogue}'"
    docker run -v ${current_app}_${epilogue}:/volume -v $BACKUP_ROOT/${current_app}:/backup --rm loomchild/volume-backup backup "${NOW}_${current_app}_${epilogue}"
  done

  docker-compose start $current_app
  find $BACKUP_ROOT/${current_app} -mtime +7 -type f -delete
}

backup_volumes nextcloud data apps
backup_volumes bitwarden data
backup_volumes mysql-backup data
