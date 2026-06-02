#/!bin/bash

ACTIVE_DIR="active_logs"
ARCHIVE_DIR="archived_logs"
REPORTS_DIR="reports"

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
