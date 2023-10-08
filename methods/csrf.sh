#!/usr/bin/env bash

response_csrf=$(curl -s \
  -b "xfNew_tfa_trust=${user_tfa}; xfNew_user=${user_id}%2C${user_auth}" \
  -c - \
  "https://hypixel.net/rules" \
)

xfToken="$(grep -oP '(?<=data-csrf=")[^"]*' -m 1 <<< $response_csrf)"
cookie="$(tail -3 <<< $response_csrf)"

RESPONSE "CSRF" "${xfToken}"

INFO "Received csrf"