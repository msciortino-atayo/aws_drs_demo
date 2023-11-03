# AWS Elastic Disaster Recovery Service Demo

- [AWS Elastic Disaster Recovery Service Demo](#aws-elastic-disaster-recovery-service-demo)
  - [Architecture Diagram](#architecture-diagram)
  - [Configure AWS Elastic Disaster Recovery Service default settings](#configure-aws-elastic-disaster-recovery-service-default-settings)
    - [Default Replication](#default-replication)
    - [Default launch](#default-launch)

## Architecture Diagram
![](/diagrams/AWS%20Elastic%20Disaster%20Recovery%20Demo%20Architecture.png)

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

