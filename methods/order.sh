#!/usr/bin/env bash

response_order=($(curl -s \
  -X GET \
  "https://hypixel.net/forums/59/index.rss" \
  | grep -oP '(?<=<guid isPermaLink="false">)[^<]*' \
))

RESPONSE "ORDER" "${response_order[*]}"

post_order="1000"
for post in "${!response_order[@]}"; do
    if [ ${response_order["${post}"]} == "${post_id}" ]; then
        echo [ ${response_order["${post}"]} == "${post_id}" ]
        echo $post
        post_order="$((post+1))"
        break
    fi
done

INFO "Got the post order ($post_order)"