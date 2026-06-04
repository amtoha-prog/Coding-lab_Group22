#!/bin/bash

#process_vitals function start

process_vitals(){
  grep "CRITICAL" heart_rate_log.log | awk -F'[|]' '{print $1, $2, $3}' >> ../reports/critical_alerts.txt
  grep "CRITICAL" temperature_log.log | awk -F'[|]' '{print $1, $2, $3}' >> ../reports/critical_alerts.txt

}

process_vitals

#process_vitals function end
