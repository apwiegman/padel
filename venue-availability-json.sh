#!/bin/bash

tenant_id=$1
start_date=$2
end_date=$3

curl --location "https://playtomic.io/api/v1/availability?user_id=me&tenant_id=$tenant_id&sport_id=PADEL&local_start_min=$start_date&local_start_max=$end_date" \
| jq "[.[] | {tenant_id: \"$tenant_id\", resource_id: .resource_id, start_date: .start_date } + (.slots[])]" 

echo "Successfully extracted availability for tenant $tenant_id between $start_date and $end_date"
