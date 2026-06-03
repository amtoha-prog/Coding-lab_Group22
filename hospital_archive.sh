#!/bin/bash


# ============================================================
# hospital_archive.sh
# Member 4 — The Archivist
# ============================================================


rotate_logs() {

TIMESTAMP=$(date +"%Y%m%d_%H%M")

 echo "--------------------------------------------"
    echo " KNH Log Rotation — $(date)"
    echo "--------------------------------------------"

    LOG_FILES=("heart_rate.log" "temperature.log" "water_usage.log")

    for LOG in "${LOG_FILES[@]}"; do

        SOURCE="active_logs/${LOG}"
        BASENAME="${LOG%.log}"
        DEST="archived_logs/${BASENAME}_${TIMESTAMP}.log"

        if [ -f "$SOURCE" ]; then
            mv "$DEST" # fresh move, no append
            echo "[ARCHIVED]  $SOURCE  -->  $DEST"
        else
            echo "[WARNING]   $SOURCE not found — skipping."
        fi

        touch "$SOURCE"
        echo "[RESET]     $SOURCE recreated (empty)"

    done

    echo "--------------------------------------------"
    echo " Rotation complete. System continuity maintained."
    echo "--------------------------------------------"
}

if [ ! -d "active_logs" ] || [ ! -d "archived_logs" ]; then
    echo "[ERROR] Required directories missing. Run hospital_admin.sh to set up directories."
    exit 1
fi

rotate_logs
