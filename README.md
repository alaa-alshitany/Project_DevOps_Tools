# Task-on-terraform-jenkins-ansible-docker-AWS

## 📝 Overview
This project focuses on automating the end-to-end infrastructure provisioning and deployment process on AWS. By integrating Jenkins for orchestration, Terraform for managing infrastructure as code (IaC), and Ansible for configuration management, it establishes a robust CI/CD pipeline. 

This pipeline automates the creation and configuration of infrastructure, ensuring efficient and reliable deployment of applications. The aim is to enhance operational efficiency and streamline the deployment process through automation and IaC principles.

---

## 🚀 Key Features
- **Infrastructure as a Code (IaC) using Terraform**
- **CI/CD Orchestration using Jenkins**
- **Configuration Management using Ansible**
- **Cloud Provider: AWS**
- **Containerization using Docker**

---

## 📋 Prerequisites
- **AWS account with S3 bucket and dynamodb table.**
- **Initialize the remote backend.**
  [Terraform/backend.tf](https://github.com/alaa-alshitany/Project_DevOps_Tools/blob/main/Terraform/backend.tf)

- **Make 2 Ansible Roles:**
  - One for [Jenkins-Master](https://github.com/alaa-alshitany/Project_DevOps_Tools/blob/main/Ansible/Jenkins-Master/README.md)
  - One to be as [Jenkins-Slave](https://github.com/alaa-alshitany/Project_DevOps_Tools/blob/main/Ansible/Jenkins-Slave/README.md)

- **Create 2 ec2 on your AWS account to be (jenkins master & Slave)**
  ![Screenshot from 2024-05-20 01-26-50](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/9e014459-5b88-4803-83a8-72acb572fe2a)

  ![Screenshot from 2024-05-20 01-18-48](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/20c9f554-7a8d-4a9c-9212-097cfb05d6df)

---

## 📜 Main Steps
1. **Create jenkins pipeline to run terraform Code**
  ![Screenshot from 2024-05-20 01-59-29](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/8a0703c5-02a8-4597-a7b3-ebbfbf0e33af)

  ![Screenshot from 2024-05-20 01-59-35](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/9074f5e3-44ed-4880-9d8c-f3353d2c352e)

  ![Screenshot from 2024-05-20 02-53-54](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/3e17f377-811c-49e0-9fdb-4ec97148a303)

2. **Configure Ansible to run over private ips through Bastion**
   ```
   [application]
10.0.3.132 ansible_user=ubuntu ansible_ssh_private_key_file=../Terraform/key.pem ansible_ssh_common_args='-o ProxyCommand="ssh -W %h:%p -i ../Terraform/key.pem ubuntu@54.154.222.120"'
   ```

3. **Write ansible script to configure ec2 to run as jenkins slaves**
![Screenshot from 2024-05-26 10-19-37](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/28424e87-4f43-4cfb-be72-9ff5cb5aa762)

![Screenshot from 2024-05-26 10-19-46](https://github.com/alaa-alshitany/Project_DevOps_Tools/assets/71197108/917726ef-e0db-443e-8f48-bb412ac0e64d)
