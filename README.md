# dream_deploy
# NOT FINISHED - 2016-04-18
Dream Deployment + Provisioning using Ansible and Shell Scripting

Provisioning: Is preformed with Vagrant + VMware Workstation plugin. Alternative manual efforts can be used.
Static Orchestration: Is preformed with Shell-Scripts and Ansible!!!
Dynamic Orchestration: Is preformed with Shell-Scripts and Ansible!!!
Automation: Is preformed with Ansible.


Brief Overview:
This repository serves as my method of how to preform the provisioning and the deployment of a small 6 node cluster which includes an Ansible controller. The End Goal is for this cluster to crunch data. The Goal is to preform this deployment from the Ansible Controller which is located on a local machine. Once the Ansible controller is provisioned and configured properly; the user should be able to provision + deploy to the cloud provider of their choosing.

Logic:
- Ansible is used to shortcut native YAML usage as much as possible. What's the purpose of Code that cannot SCALE!!!
- The Environment is setup by Ansible.
- Environment variables are handled via Shell-Scripts, XML, and Ansible Templates with Jinja2.  
- Configuration files will be Ansible Templates including Jinja2 and basic flat-files.
- An End Goal is to provide a easy method to move an organizations computing efforts away from the system-server concepts and introduce the node concept.


How to Use:
- Deploy the Ansible Controller using your favorite virtualization tool.
- Setup the Cloud provider with the following settings.
*
*
*
- Manage environments with Ansible.


Directory Structure:

* Power-on the Node
* Load the OS while setting up the Network
* Setup ssh connectivity

Orchestration:
* Finalize ssh configuration
* Setup the environment
* Load Software packages
