#!/usr/bin/env bash

response_order=$(curl -s \
  -X GET \
  "https://hypixel.net/forums/59/index.rss" \
)

readarray -t posts < <(grep -oP '(?<=<guid isPermaLink="false">)[^<]*' <<< "${response_order}")
readarray -t dates < <(grep -oP '(?<=<pubDate>)[^<]*' <<< "${response_order}")
RESPONSE "ORDER-POSTS" "${posts[*]}"
RESPONSE "ORDER-DATES" "${dates[*]}"

post_order="1000"

for post in "${!posts[@]}"; do
    if [ ${posts["${post}"]} == "${post_id}" ]; then
        post_order="$((post+1))"
        last_reply_date="${dates["$((post+1))"]}"
        break
    fi
done

INFO "Got the post order ($post_order)"