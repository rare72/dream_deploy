# dream_deploy
# NOT FINISHED - 2016-04-01
Dream Deployment + Provisioning using Ansible and Shell Scripting

Provisioning: Is preformed with Vagrant + VMware Workstation plugin. Alternativle manual efforts can be used.
Static Orchestration: Is preformed with Shell-Scripts with the help of XML and YAML. Ansible can assist!!!
Dynamic Orchestraton: Is preformed with Anisble and the help of XML for enviornment configuration. Ansible can assist!!!
Automation: Is preformed with Ansible.


Brief Overview:
This repository serves as my method of how to preform the provisioning and the deployment of a small 6 node cluster which includes an Ansible contoller. The End Goal is for this cluster to crunch data. The Goal is to preform this deployment from the Ansible Controller which is located on a local machine. Once the Ansible controller is provisioned and configured properly; the user should be able to provision + deploy to the cloud provider of their choosing. 

Logic:
- Ansible is used to shortcut native YAML usage as much as possible. Whats the purpose of Code that cannot SCALE!!!
- The Enviornment is setup by XML, YAML and Ansible.
- Enviornment variables are handled via Shell-Scripts, XML, and Ansible Templates with Jinja2.  
- Configuration files can be stored via YAML and/or Ansible Templates with Jinja2. XML will help control Enviornment variables.
- An End Goal is to provide a easy method to move an organizations computing efforts away from the system-server concepts and introduce the node concept.
    

How to Use:
- Deploy the Ansible Controller using your favorite vitualization tool. 
- Setup the Cloud provider with the following settings.
	1.
	2.
	3.

Directory Structure:
