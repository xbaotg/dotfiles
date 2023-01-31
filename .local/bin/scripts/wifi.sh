#!/bin/bash

notify-send -u low "Getting list of available Wi-Fi networks..."

wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")
theme="-theme ~/.config/rofi/themes/wifi.rasi"

connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
  toggle="睊  Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
  toggle="直  Enable Wi-Fi"
fi

chosen_network=$(echo -e "$toggle\n  Manual\n$wifi_list" | uniq -u | rofi -dmenu $theme -i -selected-row 1 -p " SSID: ")
chosen_id=$(echo "${chosen_network:3}" | xargs)

if [ "$chosen_network" = "  Manual" ]; then
  echo "a"
  mssid=$(rofi -dmenu $theme -p "Enter SSID")
  mpass=$(echo "$mssid" | awk -F "," '{print $2}')

  if [ "$mpass" = "" ]; then
    nmcli dev wifi con "$mssid"
  else
    nmcli dev wifi con "$mssid" password "$mpass"
  fi
elif [ "$chosen_network" = "直  Enable Wi-Fi" ]; then
	nmcli radio wifi on
elif [ "$chosen_network" = "睊  Disable Wi-Fi" ]; then
	nmcli radio wifi off
else
	# Message to show when connection is activated successfully
	success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
	# Get saved connections
	saved_connections=$(nmcli -g NAME connection)
	if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
		nmcli connection up id "$chosen_id" | grep "successfully" && notify-send -u low "Connection Established" "$success_message"
	else
		if [[ "$chosen_network" =~ "" ]]; then
			wifi_password=$(rofi -dmenu -p "Password: ")
		fi
		nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send -u low "Connection Established" "$success_message"
	fi
fi
