#!/usr/bin/env bash

# set -x
fetch_rfc_txt() {
	local rfc_number=$1
	local url="https://www.rfc-editor.org/rfc/rfc${rfc_number}.txt"

	curl -s -f "$url" | less -R
}

list_rfc_index() {
	curl -s https://www.rfc-editor.org/rfc/rfc-index.txt | \
	awk '/^[0-9]+ / {gsub(/[[:space:]]+$/,""); print $0}' | \
	awk '!/^$/'
}

if [ $# -eq 0 ]; then
	echo "Reading: $0 <rfc-number> | list"
	exit 1
fi


case $1 in
	list)
		echo -e "$(list_rfc_index)"
		;;
	*)
	if ! [[ $1 =~ ^[0-9]+$ ]]; then
		echo "Invalid RFC-number: $1"
		exit 1
	fi
	fetch_rfc_txt $1
	;;
esac
