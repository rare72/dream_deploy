# dream_deploy
# NOT FINISHED - 2016-05-27
Dream Deployment + Provisioning using Ansible and Shell Scripting

Provisioning: Is preformed with Vagrant w/VMware Workstation plugin. Alternative manual efforts can be used.
Static Orchestration: Is preformed with Shell-Scripts and Ansible!!!
Dynamic Orchestration: Is preformed with Shell-Scripts and Ansible!!!
Automation: Is preformed with Ansible.


Brief Overview:
This repository serves as my method of how to preform the provisioning and the deployment of a small 6 node cluster which includes an Ansible controller. The End Goal is for this cluster to crunch data. The Goal is to preform this deployment from the Ansible Controller which is located on a local machine. Once the Ansible controller is provisioned and configured properly; the user should be able to provision + deploy to the cloud provider of their choosing.

Logic:
- Ansible will do the heavy lifting.
- Lights-On is preformed by Vagrant. Automation Deployment and all heavy lifting is preformed with Ansible.
- Ansible is used to shortcut native YAML usage as much as possible. What's the purpose of Code that cannot SCALE!!!
- The Environment is setup by Ansible.
- Environment variables are handled via Shell-Scripts, XML, and Ansible Templates with Jinja2.  
- Configuration files will be Ansible Templates including Jinja2 and basic flat-files.
- An End Goal is to provide a easy method to move an organizations computing efforts away from the system-server concepts and introduce the node concept.
- Orchestration as known to the world is cool. Automating a bunch of task to bring an environment to an normalized state is not viewed as orchestration; and is what the rest of the world is doing. I hate to argue grammar and rhetoric but this is true.  A System Engineer usually struggles with outlining these task. Hints this repository.



How to Use:
- Deploy the Ansible Controller using your favorite virtualization tool.
- Setup the Cloud provider with the following settings.
*
*
*
- Manage environments with Ansible.
- To initiate the install script "wget "https://github.com/rare72/dream_deploy/raw/master/ansible-controller_install_debian.sh"


Directory Structure:

* Power-on the Node
* Load the OS while setting up the Network
* Setup ssh connectivity

Orchestration:
* Finalize ssh configuration
* Setup the environment
* Load Software packages
