# Terraform infrastructure and Ansible configuration

## Description
This project provision Two tier VPC with public and private subnets.
Public subnet contains bastion instance which can connect to MySQL database in private subnet
bastion and databse instances are in Security groups where:

Bastion security group allow only for SSH conection from anywhere with correct PEM key file
Database security group allow connectin only from security group "bastion" thru port 3306

After teraform provisioning there is configuration in ansible to install MySQL client and check connection

## Known issues
On mac when using lookup() function you can encounter below error:

md```
ASK [lookup secretsmanager secret in the current region] *************************************************************************************************************************
objc[6830]: +[__NSCFConstantString initialize] may have been in progress in another thread when fork() was called.
objc[6830]: +[__NSCFConstantString initialize] may have been in progress in another thread when fork() was called. We cannot safely call it or ignore it in the fork() child process. Crashing instead. Set a breakpoint on objc_initializeAfterForkError to debug.

```

to solve this just export below variable:

md```
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
```