#!/bin/bash
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
export AWS_REGION=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" "http://169.254.169.254/latest/meta-data/placement/region/")
export EC2_IAM_ROLE=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" "http://169.254.169.254/latest/meta-data/iam/security-credentials/")
curl -H "X-aws-ec2-metadata-token: $TOKEN" -v -o ~/.creds.json http://169.254.169.254/latest/meta-data/iam/security-credentials/$EC2_IAM_ROLE/
export AWS_ACCESS_KEY_ID=$(cat ~/.creds.json | jq -r '.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(cat ~/.creds.json | jq -r '.SecretAccessKey')
export AWS_SECURITY_TOKEN=$(cat ~/.creds.json | jq -r '.Token')
wget -O ./aws-replication-installer-init https://aws-elastic-disaster-recovery-us-east-1.s3.us-east-1.amazonaws.com/latest/linux/aws-replication-installer-init 
chmod +x aws-replication-installer-init
./aws-replication-installer-init \
--region $AWS_REGION \
--aws-access-key-id $AWS_ACCESS_KEY_ID \
--aws-secret-access-key $AWS_SECRET_ACCESS_KEY \
--aws-session-token $AWS_SECURITY_TOKEN \
--tags Key1=Value2 Key1=Value2  \
--no-prompt
