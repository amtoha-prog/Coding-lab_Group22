#!/bin/bash

#process_vitals function start

File="reports/critical_alerts.txt"

process_vitals(){
	if [ -f "$File" ]; then
                        echo "Adding Critical alerts to $File"
                else
                        echo "Creating $File file"
                        touch "$File"
                fi

  grep "CRITICAL" active_logs/heart_rate_log.log | awk -F'[|]' '{print $1, $2, $3}' >> reports/critical_alerts.txt
  grep "CRITICAL" active_logs/temperature_log.log | awk -F'[|]' '{print $1, $2, $3}' >> reports/critical_alerts.txt

  echo "Critical alerts added"

}

process_vitals

#process_vitals function end
