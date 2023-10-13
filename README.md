
# <p align="center">Hypixel Auto Bump</p>

Utility for automatically bumping your post when it falls below a specified level
# For illiterate use you may be blocked on the hypixel forum

## Features
- Don't bump post without need  
- Doesn't bump the post too often
- Editing a bump message
- Deletes the previous bump message

## Usage  
```bash
# will automatically pump with the message "Bump!"  post with ID 000000,
# if it drops below 5 and 3200 seconds have passed,
# or if the post drops below 14 without waiting 3200 seconds.
hypixel-auto-bump --post_id=000000 --message="Bump!" \
            --min_time=3200 --min_order=5 --max_order=15

# any option can be specified in the configuration.
# ${HOME}/.config/hypixel-auto-bump/config.conf
# post_id=000000
# message="Bump!"
# min_time=3200
# min_order=5
# max_order=15
hypixel-auto-bump
```
