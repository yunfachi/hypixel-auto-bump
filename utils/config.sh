#!/usr/bin/env bash

read -rd '' config <<'EOF'
# --------------------------------------------- #
#               hypixel-auto-bump               #
# You can specify each value below as an option #
# by its name.                                  #
#                                               #
# https://github.com/yunfachi/hypixel-auto-bump #
# --------------------------------------------- #

show_info=true
show_response=false
show_error=true

# --------------------------------------------- #
# Credentials Credentials Credentials Credentia #
# --------------------------------------------- #
#    xfNew_user before %2C (,)
user_id="xxxxxxx"
#    xfNew_user after %2C (,)
user_auth="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
#    xfNew_tfa_trust
user_tfa="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

# --------------------------------------------- #
# Data Data Data Data Data Data Data Data Data  #
# --------------------------------------------- #
#    Can be obtained by taking the numbers after the dot in the link to the post
post_id=0000000
#    The message that will be sent
message="bump"

#    Minimum time from last message to bump (minutes)
min_time=60
#    Sticky (pinned) posts are never counted towards post order
#    [2-20] Will send a bump if the order is greater than this value and more than min_time has passed since the last message
min_order=5
#    [2-20] Will instantly send a bump if the order is greater than this value despite the min_time
max_order=14
EOF

# Github : https://github.com/dylanaraps/neofetch/blob/master/neofetch#L4775
get_user_config() {
    # --config_file /path/to/config.conf
    if [[ -f "$config_file" ]]; then
        source "$config_file"
        INFO "Loaded the config (${config_file})"
        return

    elif [[ -f "${XDG_CONFIG_HOME}/hypixel-auto-bump/config.conf" ]]; then
        source "${XDG_CONFIG_HOME}/hypixel-auto-bump/config.conf"
        INFO "Loaded the config (${XDG_CONFIG_HOME}/hypixel-auto-bump/config.conf)"

    elif [[ -f "${XDG_CONFIG_HOME}/hypixel-auto-bump/config" ]]; then
        source "${XDG_CONFIG_HOME}/hypixel-auto-bump/config"
        INFO "Loaded the config (${XDG_CONFIG_HOME}/hypixel-auto-bump/config)"

    elif [[ -z "$no_config" ]]; then
        config_file="${XDG_CONFIG_HOME}/hypixel-auto-bump/config.conf"

        # The config file doesn't exist, create it.
        mkdir -p "${XDG_CONFIG_HOME}/hypixel-auto-bump/"
        printf '%s\n' "$config" > "$config_file"

        get_user_config
    fi
}

get_user_config
SPACE