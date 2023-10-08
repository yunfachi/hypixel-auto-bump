#!/usr/bin/env bash

response_reply=$(curl -s \
  -X POST \
  -H "Content-Type: multipart/form-data" \
  -b <(echo "${cookie}") \
  -F "message_html=${message}" \
  -F "_xfToken=${xfToken}" \
  -F "_xfResponseType=json" \
  "https://hypixel.net/threads/${post_id}/add-reply" \
)

RESPONSE "REPLY" "${response_reply}"

last_reply="$(grep -oP '(?<="redirect": "https://hypixel.net/posts/)[^/]*' -m 1 <<< $response_reply)"

INFO "Sent a bump (https://hypixel.net/posts/${last_reply})"