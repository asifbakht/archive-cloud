# archive-cloud

Terraform is designed in modular based that creates resources in AWS Cloud once applied creates following resources:

Single resource:

1. ALB
2. ALB Security Group
3. VPC
4. Elastic Cluster
5. ALB Listener

Resources are created based for single archive project:

1. Elastic Container Repo
2. Elastic Container Service
3. Target Group
4. Security Group for ECS
5. Extends Listener Rule with Path based routing

If different archives are later required to added then it just need to add archive module and provide unique names to module. 


It will create single ALB that expose 1 single URL with listener rules where number of rules can be added based on number of archives added. Each rule 
will have their own path. ALB listener is connected to TargetGroup where target group have private security groups that only accept communication from
ALB security group. Target groups are connected to ECS, means each archive ECS will talk to ALB privately using security group.

ECS will create EC2 instance using task definition with provided cpu and memory limit and the instance can be scaled up and scale down baesd on load.
