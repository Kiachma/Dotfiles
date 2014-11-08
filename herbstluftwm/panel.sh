#!/bin/bash

# todo: fontello icons

# disable path name expansion or * will be expanded in the line
# cmd=( $line )
set -f

function uniq_linebuffered() {
    awk -W interactive '$0 != l { print ; l=$0 ; fflush(); }' "$@"
}

function volume () {
    val=$(amixer sget Master | sed -n 's/.*\[\([0-9/]*%\)\].*/\1/p' | uniq)

    echo -n  " $val"
}


function termStatus(){
    t='/sys/class/thermal/thermal_zone0'
    curr=$(cat $t/temp)
    degrees=$(printf '%d / 1000\n' $curr | bc)
    echo " $degrees °C"
}

function get_mpd_song() {
    # use mpc to get currently playing song, uppercase it
    song=$(qdbus org.mpris.clementine /Player org.freedesktop.MediaPlayer.GetMetadata | grep title: |  cut -c8- | cut -c-70)       
    #song=$(ncmpcpp --now-playing | sed -e 's#.*) \(\)#\1#')   
    # let's skip ft. parts, etc. to get some more space
    if [ "$song" != "" ] && [[ $song != Couldn* ]]; then
        echo -n "  $song" 
    else
        echo -n ""
    fi
}
function RAM_usage() {
    used=$(free -m | grep Mem | awk '{print $3}' )
    tot=$(free -m | grep Mem | awk '{print $2}' )
    echo " $used / $tot"
}
function nextEvent(){
    EVENT=$(cat  /tmp/gcalcli_agenda.txt | sed -n '2p' |sed 's/[ \t]*$//')
    echo "$EVENT"
}
function wifiStatus(){
    QUAL=$(iwconfig wlan0 | grep 'Link Quality=' | awk '{gsub(/[=/]/," "); print $3}')
    MAX=$(iwconfig wlan0 | grep 'Link Quality=' | awk '{gsub(/[=/]/," "); print $4}')
    PERC=$(echo $QUAL*100/$MAX | bc)
    icon=""
    if ((0<=$PERC && $PERC<=20))
        then
        icon=""
    elif ((20<=$PERC && $PERC<=40))
        then
        icon=""
    elif ((40<=$PERC && $PERC<=60))
        then
        icon=""
    elif ((60<=$PERC && $PERC<=80))
        then
        icon=""
    elif ((80<=$PERC && $PERC<=100))
        then
        icon=""
    else
        icon="$PERC"
    fi 
    echo $icon
}
function Battery() {
    #!/bin/bash
    # BATTERY ICONS:
    #      


    BAT=`acpi -b | awk '{gsub(/%,/,""); print $4}' | sed 's/%//g'`
    STATUS=`acpi -b | awk '{gsub(/,/,""); print $3}'`

    # Set Icon
    icon=""
    if [[ $STATUS != "Discharging" ]]; then
        icon=""
    elif [[ $BAT -lt 10 ]]; then
        icon=""
    elif [[ $BAT -lt 40 ]]; then
        icon=""
    elif [[ $BAT -lt 70 ]]; then
        icon=""
    else
        icon=""
    fi

    # bar=""
    # case $BAT in
    #     100)
    #         bar=""
    #         ;;
    #     [0-5])
    #         bar="\f2—————————"
    #         ;;
    #     [5-9])
    #         bar="\f3—\f2————————"
    #         ;;
    #     [1-2]*)
    #         bar="——\f2———————"
    #         ;;
    #     3*)
    #         bar="———\f2——————"
    #         ;;
    #     4*)
    #         bar="————\f2—————"
    #         ;;
    #     5*)
    #         bar="—————\f2————"
    #         ;;
    #     6*)
    #         bar="——————\f2———"
    #         ;;
    #     7*)
    #         bar="———————\f2——"
    #         ;;
    #     8*)
    #         bar="————————\f2—"
    #         ;;
    #     *)
    #         bar="—————————"
    #         ;;
    # esac

    # Create Bar
    REMAINING=$(acpi -b | awk '{gsub(/%,/,""); print $5}' |cut -c 1-5 )
    echo "$icon $REMAINING"

}


monitor=${1:-0}

separator="%{F#FFcee318} | %{F-}"
song=$(get_mpd_song)

herbstclient pad $monitor 25
{
    # events:

    # date
    while true ; do
        date +'date_day %A %e.%-m '
        date +'date_min %H:%M  '
        echo tick1
        sleep 1 || break
    done > >(uniq_linebuffered) &
    date_pid=$!

    # hlwm events
    herbstclient --idle

    # exiting; kill stray event-emitting processes
    kill $date_pid1
} 2> /dev/null | {
    TAGS=( $(herbstclient tag_status $monitor) )
    unset TAGS[${#TAGS[@]}-1]
    date_day=""
    date_min=""
    visible=true

    while true ; do
        echo -n "%{S$monitor}%{U#FFcee318}%{c}"
        for i in "${TAGS[@]}" ; do
            case ${i:0:1} in
                '#') # current tag
                    echo -n "%{+u}%{F#FFf3f3f3}"
                    ;;
                '+') #  the tag is viewed on the specified MONITOR, but this monitor is not focused. 
                    echo -n "%{-u}%{F#FFcee318}"
                    ;;
                ':') # the tag is not empty 
                    echo -n "%{-u}%{F#FFcee318}"
                    ;;
                '!') # the tag contains an urgent window 
                    echo -n "%{-u}%{Fred}"
                    ;;
                '%') # % the tag is viewed on a different MONITOR and it is focused. 
                    echo -n "%{+u}%{F#FFf3f3f3}%{U#FFbe67e1}"
                    ;;
                '-') # the tag is viewed on a different MONITOR, but this monitor is not focused. 
                    echo -n "%{-u}%{F#FFbe67e1}"
                    ;;
                *)
                    echo -n "%{-u}%{F#FFaaaaaa}"
                    ;;
            esac
            echo -n "  ${i:1}  " | tr '[:lower:]' '[:upper:]'
        done
        # align left
        echo -n "%{l}%{F#FFf3f3f3}"
        # display song and separator only if something's playing
        if [ "$song" == "" ]; then
            echo -n "$next_event"
        
        else
            echo -n "$song"
        fi
        echo -n "$separator"

        # align right
        echo -n "%{r]"
        echo  -n " $separator $volume_str"
        echo  -n " $separator $RAM"   
        echo  -n " $separator $thermstatus"   
        echo  -n " $separator $batstatus"     # ⚡
        echo  -n " $separator $wifi_str"
        # echo -n "$(Battery)$separator "
        # echo -n $(iwgetid | sed -n -e 's/^.*ESSID://p' | tr -d '"' )
        echo -n "$separator"
        echo -n "$date_day" | tr '[:lower:]' '[:upper:]'
        echo -n "%{F#FFaaaaaa}"
        echo -n " $date_min  " | tr '[:lower:]' '[:upper:]'
        echo
     
        # wait for next event
        read line || break
        cmd=( $line )
        # find out event origin
        case "${cmd[0]}" in
            tag*)
                TAGS=( $(herbstclient tag_status $monitor) )
                unset TAGS[${#TAGS[@]}-1]
                ;;
            date_day)
                date_day="${cmd[@]:1}"
                ;;
            date_min)
                date_min="${cmd[@]:1}"
                ;;
            quit_panel)
                exit
                ;;
            reload)
                exit
                ;;
            tick1)
    
                song="$(get_mpd_song)"
                batstatus="$(Battery)"
                thermstatus="$(termStatus)"
                wifi_str="$(wifiStatus)"
                RAM="$(RAM_usage)"
                volume_str="$(volume)"
                next_event="$(nextEvent)"
                ;;
        esac
    done
} 2> /dev/null | bar -g x25++ -u 3 -f -*-terminus-bold-r-*-*-12-*-*-*-*-*-*-*,-*-stlarch-*-*-*-*-*-*-*-*-*-*-*-* $1
