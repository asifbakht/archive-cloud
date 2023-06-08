# archive-cloud

Terraform is designed in modular based that creates resources in AWS Cloud once applied creates following resources:

Single resource:

1. ALB
2. ALB Security Group
3. VPC
4. Elastic Cluster
5. ALB Listener

Resources based on archive project
6. Elastic Container Repo
7. Elastic Container Service
8. Target Group
9. Security Group for ECS
10. Extends Listener Rule with Path based routing


It will create single ALB that expose 1 single URL with listener rules where number of rules can be added based on number of archives added. Each rule 
will have their own path. ALB listener is connected to TargetGroup where target group have private security groups that only accept communication from
ALB security group. Target groups are connected to ECS, means each archive ECS will talk to ALB privately using security group.

ECS will create EC2 instance using task definition with provided cpu and memory limit and the instance can be scaled up and scale down baesd on load.
