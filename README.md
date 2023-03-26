# AWS Elastic Wordpress Instance built by terraform
A fully elastic 3-tier Wordpress instance hosted on AWS Cloud, formed by Terraform. 

# Technologies
AWS Services used:
    - Amazon EC2 Instances, Application Load Balancer(ALB), Auto Scaling Groups(ASG), Amazon Elastic File System(EFS), Relational Database System(RDS), Amazon Virtual Private Cloud(VPC), Identity Management(IAM), AWS Systems Manager(SSM Parameter)

## To build on terraform
1. run terraform config with your GIT and AWS credentials
2. Terraform should output the Load Balancer DNS in which you can access the Wordpress page hosted by your EC2 instance. You can also get the ALB DNS from the [AWS ALB console](https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#LoadBalancers:).
3. To test the scaling group, you can:-
    1. Connect to the [EC2 instance](https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#Instances:v=3;$case=tags:true%5C,client:false;$regex=tags:false%5C,client:false) via Session Manager.
    2. run `sudo bash`
    3. run `cd`
    4. run `stress -c 2 -v -t 3000`. This stresses the CPU on the instance and after a few minutes, the Auto Scaling Group will detect high CPU load and begin provisioning new instances.


## To clear the infrastructure
1. Run the `terraform destroy` command
2. This will terminate all instances associated with the ASG and also the resources created by Terraform.