#!/usr/bin/env sh

capacity=$(upower -d | grep percentage | head -n 1 | sed 's/\s*percentage:\(\s\)*//' | sed 's/%//')
status=$(upower -d | grep state | head -n 1 | sed 's/\s*state:\(\s\)*//')
plugged=$(upower -d | grep "line_power_AC0" -A 8 | grep online | sed "s/\s*online:\s*//")

jq -r -n --arg cap $capacity --arg status $status --arg plugged $plugged '{capacity:$cap, status:$status, plugged:$plugged}'
