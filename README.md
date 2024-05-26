# Task-on-terraform-jenkins-ansible-docker-AWS



## 📝 Overview
This project focuses on automating the end-to-end infrastructure provisioning and deployment process on AWS. By integrating Jenkins for orchestration, Terraform for managing infrastructure as code (IaC), and Ansible for configuration management, it establishes a robust CI/CD pipeline. 

This pipeline automates the creation and configuration of infrastructure, ensuring efficient and reliable deployment of applications. The aim is to enhance operational efficiency and streamline the deployment process through automation and IaC principles.



## 🚀 Key Features
- **Infrastructure as a Code (IaC) using **Terraform****
- **CI/CD Orchestration using **Jenkins****      
- **Configuration Management using  **Ansible****
- **Cloud Provider **AWS****
- **Containerization using **Docker****                                         



## 📋 Prerequisites
- AWS account with S3 bucket and dynamodb table.
- Initialize the remote backend.
      [Terraform/backend.tf](https://github.com/alaa-alshitany/Project_DevOps_Tools/blob/main/Terraform/backend.tf)

- Make 2 Ansible Roles : 
   - one for [Jenkins-Master](https://github.com/alaa-alshitany/Project_DevOps_Tools/blob/main/Ansible/Jenkins-Master/README.md)
   - one to be as [Jenkins-Slave](https://github.com/alaa-alshitany/Project_DevOps_Tools/blob/main/Ansible/Jenkins-Slave/README.md)

- Create 2 ec2 on your AWS account to be (jenkins master & Slave)
![Screenshot from 2024-05-20 01-26-50](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/9e014459-5b88-4803-83a8-72acb572fe2a)

- Configure Master One.
![Screenshot from 2024-05-20 01-18-48](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/20c9f554-7a8d-4a9c-9212-097cfb05d6df)

![Screenshot from 2024-05-20 01-19-22](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/b8b10307-d5bc-4ce3-9ef6-cf076c2a090a)

- Configure Slave One.
![Screenshot from 2024-05-20 01-47-35](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/156d3b38-4b04-4436-8438-dcfed3da53c5)

![Screenshot from 2024-05-20 01-47-44](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/d0ce69fd-2817-46db-bd8a-5506aaf6f890)

![Screenshot from 2024-05-20 01-56-35](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/58957bb3-1a42-4fea-82e0-07316977dff7)

![Screenshot from 2024-05-20 01-43-40](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/6240cc23-542d-43f8-9f78-4e47c92faf5f)

![Screenshot from 2024-05-20 01-44-08](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/d808cf0e-6ab1-40c2-8b4c-dd4a89be06ff)

