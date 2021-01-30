#!/bin/bash

ip_addresses=$( echo ${TV_IPS} | tr -d '"')
ip_list=()

for ip_address in ${ip_addresses}
do

    num_valid_parts=0
    parts=$( echo ${ip_address} | tr "." " ")
    # check 4 parts for validity
    for part in ${parts}
    do
        if [[ "${part}" =~ ^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$ ]]
        then
            num_valid_parts=$(( num_valid_parts+=1 ))
        fi
    done

    if [ ${num_valid_parts} -eq 4 ]
    then
        echo "Valid IP address ${ip_address} was detected."
        ip_list+=( ${ip_address} )
    else
        echo "IP address ${ip_address} does not seem valid."
    fi

done

if [ ${#ip_list[@]} -eq 0 ]
then
    echo "No valid IPs detected."
    exit 1
fi

echo "Starting ADB server..."
adb -a -P 5037 server nodaemon &

sever_wait=5
connect_retry=10

echo "Waiting ${sever_wait} seconds for the server to start."
sleep ${sever_wait}

while [ 1 ]
do
    for ip in ${ip_list[@]}
    do
        echo "Connecting to ${ip}"
        adb connect ${ip}
    done
    
    echo "Waiting ${connect_retry} seconds for the next reconnect."
    sleep ${connect_retry}
done