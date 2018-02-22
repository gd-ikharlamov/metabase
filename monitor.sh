#!/bin/env bash
InstanceID=$(curl -s "http://169.254.169.254/latest/meta-data/instance-id")
TIMESTAMP=$(date +%Y-%m-%d"T"%H:%M:%SZ)
METABASE_STATUS=$(curl -s 'https://mb-pilot.griddynamics.net/api/health' | grep -oP "status\"\:\"\K\w+")

if [ $METABASE_STATUS == "ok" ];
    then
        METABASE_UP=1
    else
        METABASE_UP=0
fi

export AWS_DEFAULT_REGION=eu-west-1
/home/centos/.local/bin/aws cloudwatch put-metric-data --namespace http_endpoint --dimensions InstanceID=$InstanceID --metric-name MetabaseStatus --value $METABASE_UP --timestamp $TIMESTAMP
