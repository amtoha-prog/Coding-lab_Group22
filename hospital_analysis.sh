#!/bin/bash

#process_vitals function start

process_vitals(){
  grep "CRITICAL" heart_rate_log.log | awk -F'[|]' '{print $1, $2, $3}' >> ../reports/critical_alerts.txt
  grep "CRITICAL" temperature_log.log | awk -F'[|]' '{print $1, $2, $3}' >> ../reports/critical_alerts.txt

}

process_vitals

#process_vitals function end

water_audit() {
	echo "ICU water reserve audit"
	local WATER_LOG="active_logs/water_usage_log.log"
	if [ ! -f "$WATER_LOG" ]; then
		echo "Error: $WATER_LOG not found"
		return 1
	fi
