#!/bin/bash

rotate_logs() {
    TIMESTAMP=$(date +"")
    echo "KNH Log Rotation — $(date)"
    LOG_FILES=("heart_rate_log.log" "temperature_log.log" "water_usage_log.log")
    for LOG in "${LOG_FILES[@]}"; do
        SOURCE="active_logs/${LOG}"
        BASENAME="${LOG%.log}"
        DEST="archived_logs/${BASENAME}_${TIMESTAMP}.log"
        if [ -f "$SOURCE" ]; then
            mv "$SOURCE" "$DEST"
            echo "[ARCHIVED] $SOURCE --> $DEST"
        else
            echo "[WARNING] $SOURCE not found"
        fi
        touch "$SOURCE"
        echo "[RESET] $SOURCE recreated"
    done
    echo "Rotation complete"
}

if [ ! -d "active_logs" ] || [ ! -d "archived_logs" ]; then
    echo "[ERROR] Required directories missing"
    exit 1
fi

rotate_logs
