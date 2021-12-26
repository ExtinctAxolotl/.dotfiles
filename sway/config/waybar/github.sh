#!/bin/bash
token=`cat ${HOME}/.config/github/notifications.token`
count=`curl -u ExtinctAxolotl:${token} https://api.github.com/notifications | jq '. | length'`

if [[ "$count" != "0" ]]; then
    echo '{"text":'$count',"tooltip":"$tooltip","class":"$class"}'
fi
