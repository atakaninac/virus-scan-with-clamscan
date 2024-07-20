#!/bin/bash

#Scans files for viruses using clamscan.

#Check if clamscan has been installed on machine.
command -v clamscan > /dev/null
if [ "$?" == 1 ]; then
	echo "clamscan is not installed."
	exit 1
fi

#Help section for script.
show_help() {
	echo "Usage: $0 <file_or_directory> <name>"
	echo ""
	echo "file_or_directory: Specify if you want to scan a directory or a file. "
	echo "for file type -f, for directory type -d"
	echo "name: Name of the file or directory you want scan for viruses."
}

SCAN_TYPE=$1
FILE=$2

#Call the help section if user wanted to.
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
	show_help
	exit 0
fi

#Scan the file or directory for viruses.
if [ "$SCAN_TYPE" == "-f" ]; then 
	clamscan "$2"
	exit 0
	
elif [ "$SCAN_TYPE" == "-d" ]; then
	clamscan -r "$2"
	exit 0
	
else
	echo "Use -f or -d arguments."
	show_help
	exit 1
fi
