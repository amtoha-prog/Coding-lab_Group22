#!/usr/bin/env bash

#Member 1 - The Architect

# Directory names as variables
ACTIVE_DIR="active_logs"
ARCHIVE_DIR="archived_logs"
REPORTS_DIR="reports"


#Function checks if the required directories exist if not it creates them
initialize_system() {
	echo "Initializing"
	for dir in "$ACTIVE_DIR" "$ARCHIVE_DIR" "$REPORTS_DIR"; do
		if [ -d "$dir" ]; then
			echo "Directory '$dir' already exists."
		else
			echo "Creating $dir directory"
			mkdir -p "$dir"
		fi
	done 
}

secure_data() {
	echo "Securing $ACTIVE_DIR"
	if [ ! -d "$ACTIVE_DIR" ]; then
		echo "Error: $ACTIVE_DIR does not exist. Run initialize_system first"
		return 1
	fi

	chown  "$(whoami)" "$ACTIVE_DIR" 2>/dev/null
	chmod 700 "$ACTIVE_DIR"

	if ls "$ACTIVE_DIR"/*.log >/dev/null/ 2>&1; then
		chmod 600 "$ACTIVE_DIR"/*.log
	fi

	echo "Permissions updated. Current state:"
	ls -ld "$ACTIVE_DIR"
	ls -l "$ACTIVE_DIR"
}
main() {
     initialize_system
     secure_data
     echo "--------------------------------------------"
     echo "System Environment Secured"
     echo "$(date)"
     echo "--------------------------------------------"
}

main
