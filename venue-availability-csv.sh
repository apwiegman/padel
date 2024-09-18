#!/bin/bash

# Current week
current_week=$(date +"%V")
echo "Current Week: $current_week"

# Variables
tenant_id=$1
start_timestamp=$2
end_timestamp=$3


file="week-$current_week-availability.csv"

# Check if the file exists, if not, write headers
if [ ! -f "$file" ]; then
    echo '"tenant_id", "resource_id", "start_date", "start_date", "duration", "price"' >> "$file"
fi

curl --location "https://playtomic.io/api/v1/availability?user_id=me&tenant_id=$tenant_id&sport_id=PADEL&local_start_min=$start_timestamp&local_start_max=$end_timestamp" \
| jq "[.[] | {tenant_id: \"$tenant_id\", resource_id: .resource_id, start_date: .start_date } + (.slots[])]" \
| jq -r ".[] | [.tenant_id, .resource_id, .start_date, .start_time, .duration, .price] | @csv"  >> "$file"

echo "Successfully extracted availability for tenant $tenant_id between $start_timestamp and $end_timestamp"
