#!/bin/bash

####################
# Author    :   Kapil
# Date      :   April 22, 2023
#
# Version   :   v1
# This script will report the AWS report usage
####################

set -x

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM users

# list s3 buckets
echo "Print list of S3 buckets"
aws s3 ls > resourceTracker

# list EC2 instances
echo "Print list of EC2 instances"
aws ec2 describe-instances | jq.'.Reservations[].Instances[].InstanceId'

# list lambda
echo "Print list of Lambda functions"
aws lambda list-functions >> resourceTracker:q!

# list iam users
echo "Print list of IAM users"
aws iam list-users