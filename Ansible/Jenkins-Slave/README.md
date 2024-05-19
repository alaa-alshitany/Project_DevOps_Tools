Jenkins-Slave Role
=========

This Ansible role sets up a system to be used as a Jenkins slave node. It installs necessary dependencies such as Java, Docker, and Terraform, and creates a Jenkins user with appropriate permissions.

Requirements
------------

- This role assumes that the target system is an Ubuntu-based Linux distribution.
- Internet access is required for package installation and downloading Terraform.
- The role should be run with appropriate privileges to perform system-level tasks.


Role Variables
--------------

This role does not have any configurable variables. However, you may want to customize the versions of Java, Docker, and Terraform installed. Currently, the role installs:
- OpenJDK 11
- Docker
- curl, gnupg, and unzip
- Terraform version 1.8.3 

Example Playbook
----------------
```
- name: Apply Jenkins Slave role
  hosts: jenkins_slaves
  become: true
  roles:
    - jenkins-slave
```

License
-------

BSD

Author Information
------------------

For any issues or feedback, please contact alaa2alshitany@gmail.com .
