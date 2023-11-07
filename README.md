# AWS Elastic Disaster Recovery Service Demo

- [AWS Elastic Disaster Recovery Service Demo](#aws-elastic-disaster-recovery-service-demo)
  - [Architecture Diagram](#architecture-diagram)
  - [Install AWS Elastic Disaster Recovery Agent on EC2 Instance](#install-aws-elastic-disaster-recovery-agent-on-ec2-instance)
    - [Create a new EC2 Instance](#create-a-new-ec2-instance)
    - [Use an existing EC2 Instance](#use-an-existing-ec2-instance)
  - [Create CloudWatch Metric Alarms for Registered Servers](#create-cloudwatch-metric-alarms-for-registered-servers)
  - [Simulate a failed EC2 Instance](#simulate-a-failed-ec2-instance)
  - [Initiate Recovery Drill](#initiate-recovery-drill)
  - [View the status of the recovery job.](#view-the-status-of-the-recovery-job)
  - [Configure AWS Elastic Disaster Recovery Service default settings](#configure-aws-elastic-disaster-recovery-service-default-settings)
    - [Default Replication](#default-replication)
    - [Default launch](#default-launch)

## Architecture Diagram
![](/diagrams/AWS%20Elastic%20Disaster%20Recovery%20Demo%20Architecture.png)

## Install AWS Elastic Disaster Recovery Agent on EC2 Instance

### Create a new EC2 Instance

1. Launch an EC2 instance using the provided CloudFormation template: [here](templates/ec2_instance.yaml)

### Use an existing EC2 Instance

1. Connect to the running EC2 instance's terminal
2. Run the script provided here: [here](scripts/init_script.sh)

## Create CloudWatch Metric Alarms for Registered Servers

1. Use the provided CloudFormation template: [here](templates/drs_alarm.yaml)
2. Click on "Confirm subscription" link in email from AWS SNS with the subject "AWS Notification - Subscription Confirmation"

## Simulate a failed EC2 Instance
1. Navigate to EC2 service in the AWS console
2. Select the EC2 instance registered as a source server in DRS
3. Click on "Instance state" and select "Stop instance"
4. Wait 5 minutes
5. An email should be sent from SNS to the subscribed email that says the source server alarm has been triggered

## Initiate Recovery Drill
1. Navigate to AWS Elastic Disaster Recovery Service in the AWS console
2. Select the source server to run the recovery drill for.
3. Click on the "Initiate recovery job" dropdown and select "Initiate recovery drill"
4. Select "Use most recent data"
5. Click "Initiate drill"

## View the status of the recovery job.

1. Click on "Recovery job history" on the left side of the AWS Elastic Disaster Recovery Service console
2. Select the most recent recovery Job ID to view its status
3. Verify that recovery instance has been launched successfully

## Configure AWS Elastic Disaster Recovery Service default settings

### Default Replication

1. Navigate to AWS Elastic Disaster Recovery Service in the AWS console
2. Click on "Default replication" under "Settings" on the left
3. Click "Edit" in the upper right corner
4. Select values for:
      - subnet ID for "Staging area subnet"
      - EC2 instance type for "Replication server instance type"
      - EBS volume settings as needed
5. Under "Security Groups" check the box for "Always use AWS Elastic Disaster Recovery security group"
6. Modify other settings as needed.
7. Click "Save"

### Default launch
1. Navigate to AWS Elastic Disaster Recovery Service in the AWS console
2. Click on "Default replication" under "Settings" on the left
3. Click "Edit" in the upper right corner for "Default DRS launch settings"
    - Select "Inactive" for "Instance type right-sizing" to ensure that EC2 instances launched by the service are not auto-sized which could incur significant cost
4. Under "Instance settings" check the boxes for "Transfer server tags" and "Start instance upon launch".
5. Modify other settings as needed.
6. Click "Save"

