#!/usr/bin/env bash

response_delete=$(curl -s \
  -X POST \
  -H "Content-Type: multipart/form-data" \
  -b <(echo "${cookie}") \
  -F "message_html=${message}" \
  -F "_xfToken=${xfToken}" \
  -F "_xfResponseType=json" \
  "https://hypixel.net/posts/${last_reply}/delete" \
)

RESPONSE "DELETE" "${response_delete}"

INFO "Deleted the previous bump"