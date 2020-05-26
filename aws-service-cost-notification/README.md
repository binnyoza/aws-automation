This script will help you get daily notification for the incurred cost of a particular AWS Service. Here in this case, I am quoting example for getting email alerts for daily cloudfront cost.   

Pre-Requisite

You will need aws cli version 1.14 to run this.

	aws --version
	aws-cli/1.14.44 Python/3.6.9 Linux/4.15.0-1065-aws botocore/1.8.48

1) Get the git pull of the repo in a directory

Make the script executable with 

	chmod +x get-cloudfront-cost.sh

2) Create a IAM Role with below policy and attach to the instance where the script is running. If running from outside AWS, then create appropriate IAM user with access key and secret key and below a policy.
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ce:*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
```

3) Run the script from cron each day and get cost updates over mail.

You can also get the cost update for any other AWS Services as well using above script and making appropriate changes to filters.json
