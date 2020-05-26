Security Group Changes Notify

Note: You must enable AWS Cloudtrail for this to work.

This cloudwatch rule will help you to get notified on slack, when anyone makes changes to the security group.

1) Goto Cloudwatch --> Events --> Rules

2) Create a New Rule and Choose Event Pattern. Edit the Event Pattern Preview and Add the below block

{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "AWS API Call via CloudTrail"
  ],
  "detail": {
    "eventSource": [
      "ec2.amazonaws.com"
    ],
    "eventName": [
      "AuthorizeSecurityGroupEgress",
      "AuthorizeSecurityGroupIngress",
      "RevokeSecurityGroupEgress",
      "RevokeSecurityGroupIngress"
    ]
  }
}

2) In the target, choose SNS Topic of your choice, preferably Slack or Email and in Configure Input, choose Input Transformer. Input Transformer filters the entire event based on the defined template.

Enter below text in 1st Text Block. This will define various available fields in cloudtrail event against a variable.

{"changetype":"$.detail.eventName","sgid":"$.detail.requestParameters.groupId","region":"$.detail.awsRegion","username":"$.detail.userIdentity.principalId"}

Enter below text in 2nd Text Block. This will form a filtered message using the variables to be sent to the SNS topic. 

"The user <username> has initiated <changetype> for Security Group with id <sgid> in <region>."

The above event will be triggered as soon as cloudtrail detects any changes to the Security group and sends notification to the SNS Topic. 
