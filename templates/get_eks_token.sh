#!/bin/bash

token=$(aws eks get-token --cluster-name ${cluster_name} --region ${region} --output json | jq -r '.status.token')

echo "{\"token\":\"$token\"}"