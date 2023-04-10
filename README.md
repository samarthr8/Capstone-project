# capstone-project

                    Capstone Project Documentation: step by step guide to the project 


Task 1 - 

Subtask 1
  Launch an EC2(Terraform) machine with the following specifications - ubuntu, t2.medium, 15gb storage, security group with 22 port open for my IP.
  Create a IAM role with Administrator access policy.
  Attach the IAM role with the EC2(Terraform).
  Install AWSCLI and terraform in the EC2(Terraform) machine.
  Create an S3 bucket(capstone-terraform) for remote storage of the backend file(tfstate file)

Subtask 2
  Write provider.tf and vpc.tf 
  Run commands terraform init, plan and apply for the creation of the required vpc resources.
  20 resources will be created

Subtask 3
  Install the EKSCTL and Kubectl in the same EC2 machine(Terraform)
  Create the cluster.yaml file 
  Run < eksctl create cluster -f cluster.yaml > to create the cluster and the nodegroups
  Install metrics server - 
    < kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml >  
  Verify with < kubectl top nodes >
  Install cluster auto scaler - 
    < kubectl apply -f clusterautoscaler.yaml >



Task 2 and 4 - 

Subtask 1
  Install docker
  Copy upg-loadme-app folder to the EC2 machine
  Create a dockerfile in the same folder
  Create a repository in dockerhub named capstone-project
  docker build -t samarthr8/capstone-project:c39 .
  Login to docker hub in terminal using docker login command 
  docker push samarthr8/capstone-project:c39

Subtask 2 
  Write a deployment.yaml and service.yaml(loadBalancer type).
  Run command < kubectl apply -f deployment.yaml >
  Then run following commands -
    kubectl get pods
    kubectl get svc , and hit the url to see Hello world page
  Write a hpa.yaml for creating a Horizontal pod autoscaler.
  Create and verify using these commands
    < kubectl apply -f hpa.yaml > 
    < kubectl get hpa >
  Create a new tainted node by editing the cluster.yaml
  Add taint toleration into the deployment.yaml file



Task 3 -

  Deploy statefulset of redis - using Helm
  Create a redis.yaml with the given modifications then use these commands to run redis
  helm repo add my-repo https://charts.bitnami.com/bitnami
  helm install my-release my-repo/redis -f redis.yaml
  Enter some data into statefulset - using RedisCli
  I will create a redis pod using < kubectl run redis --image redis>
  To enter in the redis pod  < kubectl exec -it redis bash >
  Run <redis-cli -h my-release1-redis-master -p 6379>
  Enter data <SET batch c39>
  Get data < GET batch>
  Delete the statefulset pods - New pods should come up
  Try to Retrive the data
  To enter in the redis pod  < kubectl exec -it redis bash >
  Run <redis-cli -h my-release1-redis-master -p 6379>
  Get data < GET batch>
