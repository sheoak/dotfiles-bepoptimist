#!/usr/bin/env bash

# Starts a scan of available broadcasting SSIDs
# nmcli dev wifi rescan

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SECURITY=0

if [ ! -r "$DIR/config" ]; then
    echo "WARNING: config file not found! Using default values."
    FIELDS=SSID,SECURITY,BARS
    ROFI_OPTS=
elif [ -r "$DIR/config" ]; then
    # Get values from config
    source $DIR/config
fi

LIST=$(nmcli --fields "$FIELDS" device wifi list | sed '/^--/d')
# For some reason rofi always approximates character width 2 short... hmmm
RWIDTH=$(($(echo "$LIST" | head -n 1 | awk '{print length($0); }')+2))
# Dynamically change the height of the rofi menu
LINENUM=$(echo "$LIST" | wc -l)
let LINENUM+=2

# Gives a list of known connections so we can parse it later
KNOWNCON=$(nmcli connection show)
# telling if there is currently a connection (enabled or disabled)
CONSTATE=$(nmcli r wifi)

CURRSSID=$(iwgetid -r)


if [[ ! -z $CURRSSID ]]; then
    HIGHLINE=$(echo  "$(echo "$LIST" | awk -F "[  ]{2,}" '{print $1}' | grep -Fxn -m 1 "$CURRSSID" | awk -F ":" '{print $1}') + 1" | bc ) 
fi

# HOPEFULLY you won't need this as often as I do
# If there are more than 8 SSIDs, the menu will still only have 8 lines
if [ "$LINENUM" -gt 8 ] && [[ "$CONSTATE" =~ "enabled" ]]; then
    LINENUM=8
elif [[ "$CONSTATE" =~ "disabled" ]]; then
    LINENUM=1
fi

if [[ "$CONSTATE" =~ "enabled" ]]; then
    TOGGLE="toggle off"
elif [[ "$CONSTATE" =~ "disabled" ]]; then
    TOGGLE="toggle on"
fi


CHENTRY=$(echo -e "$TOGGLE\nmanual\n$LIST" | uniq -u | rofi -dmenu -p "Wi-Fi SSID: " -lines "$LINENUM" -a "$HIGHLINE" $ROFI_OPTS -width -"$RWIDTH")
CHSSID=$(echo "$CHENTRY" | sed  's/\s\{2,\}/\|/g' | awk -F "|" '{print $1}')

if [[ -z $CHENTRY ]]; then
    exit;
fi

# If the user inputs "manual" as their SSID in the start window, it will bring them to this screen
if [ "$CHENTRY" = "manual" ] ; then
    # Manual entry of the SSID and password (if appplicable)
    MSSID=$(echo "enter the SSID of the network (SSID,password)" | rofi -dmenu -p "Manual Entry: " -lines 1 $ROFI_OPTS)
    # Separating the password from the entered string
    MPASS=$(echo "$MSSID" | awk -F "," '{print $2}')

    if [[ -z $MSSID ]]; then
        exit;
    fi

    # FIXME: connexion logic duplicated, merge with bottom lines
    # If the user entered a manual password, then use the password nmcli command
    if [ "$MPASS" = "" ]; then
        nmcli dev wifi con "$MSSID"
    else
        nmcli dev wifi con "$MSSID" password "$MPASS"
    fi

elif [ "$CHENTRY" = "toggle on" ]; then
    nmcli radio wifi on

elif [ "$CHENTRY" = "toggle off" ]; then
    nmcli radio wifi off

else

    # If the connection is already in use, then this will still be able to get the SSID
    if [ "$CHSSID" = "*" ]; then
        CHSSID=$(echo "$CHENTRY" | sed  's/\s\{2,\}/\|/g' | awk -F "|" '{print $3}')
    fi

    # Parses the list of preconfigured connections to see if it already contains the chosen SSID. This speeds up the connection process
    # FIXME: not always working
    if [[ $(echo "$KNOWNCON" | grep "$CHSSID") = "$CHSSID" ]]; then
        nmcli con up "$CHSSID"
    else
		if [[ "$CHENTRY" =~ "WPA1" ]] || [[ "$CHENTRY" =~ "WPA2" ]] || [[ "$CHENTRY" =~ "WEP" ]]; then
            SECURITY=1
			WIFIPASS=$(rofi -dmenu -no-fixed-num-lines -p "password: " -mesg "if connection is stored, hit enter" $ROFI_OPTS)
		fi

        # FIXME: merge with previous code one fixed
        if [[ -z $WIFIPASS ]] && [[ $SECURITY ]]; then
            # network regitered already, force connection
            nmcli con up id "$CHSSID"
        else
            # connect and store the network
            nmcli dev wifi con "$CHSSID" password "$WIFIPASS"
        fi
        nmcli dev wifi con "$CHSSID" password "$WIFIPASS"
    fi

fi
