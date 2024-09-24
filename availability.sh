#!/bin/bash

# Get current timestamp
start_timestamp=$(date -d "+120 minutes" +"%Y-%m-%dT%H:%M:%S")
echo "Start Timestamp: $start_timestamp"

# Add 30 minutes
end_timestamp=$(date -d "+150 minutes" +"%Y-%m-%dT%H:%M:%S")
echo "End Timestamp: $end_timestamp"

tenants=("8ff18563-099e-4bb6-b7cf-2c0f82002373" "feaf021e-8f08-49c3-b44c-4a4f66f1f216" "8f751f63-fb6b-48f6-9321-55e9951659d1" "9ecc54ca-f0d1-48b9-93d9-3d8409851fb0" "1cc5363b-e467-4bef-ad27-ba6e02df635a")

# Iterate over the tenants
for item in "${tenants[@]}"
do
    echo "Fetching availbility for venue: $item"
    ./venue-availability-csv.sh $item $start_timestamp $end_timestamp
done