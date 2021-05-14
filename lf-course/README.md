# AWS setup

Prerequisites:
1. You have a root account
2. Create an IAM user for this project
3. Set up a billing alert

## Creating the IAM user

1. Login to the management console as root user: https://aws.amazon.com/console
2. Open the IAM service
3. Navigate Access management > Users
4. Add user, give it the name terraform-learner and check the "Programmatic access" checkbox
5. Set permissions: Choose "Attach existing policies directly", filter
the policies for "AmazonEc2FullAccess" and select the policy. Click "Next: Tags"
6. Add tags: Add the tag "email" and add your email.  Click "Next: Review"
7. Click "Create user"
8. Copy and store the access key ID and secret access key to a save location (e.g. your password manager)

Note: Other options for storing the credentials are
downloading th CSV file or setting environment variables

Explain: How and where the credentials are stored

### Configuring the AWS CLI

```bash
vf activate aws
# Configure the profile for the user we created:
aws configure --profile terraform-learner
# Confirm tha our user is active in the shell by using AWS Security Token Service (STS):
aws sts get-caller-identity
```
Check that the profile and credentials have been added:

```bash
cat /Users/<USER_NAME>/.aws/config
cat /Users/<USER_NAME>/.aws/credentials
```

# Terraform: First steps

It is best to save the plan to an output file
and then use this file in the apply step.
This way we can be sure that Terraform will
execute exactly the plan we reviewed. Here are 
the involved steps:

```bash
# Save te plan:
terraform plan -out=s1.tfplan
terraform show s1.tfplan
terraform show -json s1.tfplan

terraform apply s1.tfplan
```

We can also save a plan for the destruction of resources:

```bash
terraform plan -destroy -out destroy.tfplan
```

This output the public IP address of the created EC2 instance.
We will denote it by `<IP_ADRESS>` in what follows.
We can connect via 

```bash
chmod 400 tf_key.pem
ssh -i "tf_key.pem" ec2-user@<IP_ADRESS>
```

We can see the state the following way:

```bash
terraform show
```

```bash
AWS_PAGER="" # Removes the less pagination system
aws ec2 describe-instances --query "Reservations[].Instances[].InstanceId" --output table
```



The state file. "When an implementation of an infrastructure is planned or executed, Terraform uses a state file to determine that the current status is correct."


friendly name for the resource

terraform plan --help

terraform graph --help





"Hashicorp's recommended naming convention for .tf files is to do component, environment, region, and then whatever 
other descriptor makes sense. So it could be something like, networking-prod-us-west-aws- whatever. To me, the spirit 
of that convention is that your names start with the most specific category you think you need, and then go to the most 
general that you think you need."


Security group: Think: firewall that can be assigned per instance

Resources:
* AWS provides information about tagging EC2 instances: [User Guide: Using Tags](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html?icmpid=docs_ec2_console)