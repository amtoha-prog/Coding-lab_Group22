#!/bin/bash

#process_vitals function start

process_vitals(){
  grep "CRITICAL" active_logs/heart_rate_log.log | awk -F'[|]' '{print $1, $2, $3}' >> reports/critical_alerts.txt
  grep "CRITICAL" active_logs/temperature_log.log | awk -F'[|]' '{print $1, $2, $3}' >> reports/critical_alerts.txt

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
	

	awk '
            BEGIN { FS="|" }
	    $2 ~ /ICU_WATER_RESERVE/ {
	    total += $3
	    readings++
	    if ($3 > peak) peak = $3
           }
       END {
           printf "Usage Summary\n"
           if (readings > 0) {
	      printf " Readings analysed : %d\n", readings
	      printf " Average usage     : %.2f Litres/min\n", total / readings    
	      printf " Peak usage        : %d Litres/min\n", peak
           } else {
               printf " No ICU_WATER_RESERVE data found.\n"
           }     
      }
    ' "$WATER_LOG"
}

water_audit
