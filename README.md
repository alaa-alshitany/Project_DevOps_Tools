# Task-on-terraform-jenkins-ansible-docker-AWS



## 📝 Overview
This project focuses on automating the end-to-end infrastructure provisioning and deployment process on AWS. By integrating Jenkins for orchestration, Terraform for managing infrastructure as code (IaC), and Ansible for configuration management, it establishes a robust CI/CD pipeline. 

This pipeline automates the creation and configuration of infrastructure, ensuring efficient and reliable deployment of applications. The aim is to enhance operational efficiency and streamline the deployment process through automation and IaC principles.



## 🚀 Key Features
- **Infrastructure as a Code (IaC) using **Terraform****
- **CI/CD Orchestration using **Jenkins****      
- **Configuration Management using  **Ansible** **
- **Cloud Provider **AWS****
- **Containerization using **Docker****                                         



## 📋 Prerequisites
- AWS account with S3 bucket and dynamodb table.
- Initialize the remote backend.
```
[Terraform/backend.tf](https://github.com/alaa-alshitany/Project_DevOps_Tools/blob/main/Terraform/backend.tf)
``` 

- Make 2 Ansible Roles : 
   - one for [Jenkins-Master](https://github.com/alaa-alshitany/Project_DevOps_Tools/blob/main/Ansible/Jenkins-Master/README.md)
   - one to be as [Jenkins-Slave](https://github.com/alaa-alshitany/Project_DevOps_Tools/blob/main/Ansible/Jenkins-Slave/README.md)
```

- 
