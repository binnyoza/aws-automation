#!/bin/bash
startdate=$(date --date="yesterday" +%Y-%m-%d)
enddate=$(date  +%Y-%m-%d)
aws ce get-cost-and-usage  --time-period Start=$startdate,End=$enddate --granularity MONTHLY --metrics "BlendedCost" "UnblendedCost" --group-by Type=DIMENSION,Key=SERVICE Type=TAG,Key=Environment --filter file:///filters.json | grep -A2 UnblendedCost |  tr '\n' ' ' | mail -s "My Org - Yesterday's Cloudfront Cost" -r "AWS Billing Alerts<alerts@mydomain.com>" mymail@mydomain.com
