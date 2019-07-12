#!/bin/bash
NYC=$(TZ="America/New_York" date +"NYC %H:%M")
WAW=$(TZ="Europe/Warsaw" date +"WAW %H:%M")
SFO=$(TZ="America/Los_Angeles" date +"SFO %H:%M")

TZ=$(date +%Z)

case $TZ in
  PDT|PST)
    echo "$NYC / $WAW"
    ;;
  EDT|EST)
    echo "$SFO / $WAW"
    ;;
  *)
    echo "$SFO / $NYC"
    ;;
esac

UTC=$(TZ="UTC" date +"UTC: %H:%M")
echo $UTC

UNIX=$(date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s")
echo "Unix: $UNIX"
