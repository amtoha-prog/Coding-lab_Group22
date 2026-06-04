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

initialize_system
