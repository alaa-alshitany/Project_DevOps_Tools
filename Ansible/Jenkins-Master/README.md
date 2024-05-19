Jenkins-Master Role
=========

This Ansible role configures a server as a Jenkins master, including the installation of Jenkins.


Requirements
------------

This role requires an Ubuntu-based server as the target host.

Role Variables
--------------
The following variables can be customized:

jenkins_admin_password: The password for the initial Jenkins admin user.


Example Playbook
----------------
```
- name: Configure EC2 instance as Jenkins master
  hosts: jenkins_master
  become: yes
  vars:
    jenkins_admin_password: my_admin_password
  roles:
    - jenkins-master

```

License
-------

BSD

Author Information
------------------

For any issues or feedback, please contact alaa2alshitany@gmail.com .











