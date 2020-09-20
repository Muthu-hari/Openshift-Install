# Openshift-Install

Minimum System-Requirements:
Master:
Linux 7, 2 CPU Core, 30GB of internal hard disk
Node:
Linux 7, 1 CPU Core, 8 GB RAM, 15 GB of hard disk

# Wildcard DNS entry:
In order for the external traffic that needs to be routed to openshift container platform we need to add a wildcard dns like below:
*.cloudapps.openshift.example.com.

# To access the installation packages, you must register each host with Red Hat Subscription Manager (RHSM) and attach an active OpenShift Container Platform subscription.

# On each host, register with RHSM:
subscription-manager register --username=<user_name> --password=<password>
  
# Pull the latest subscription data from RHSM:
subscription-manager refresh

# List the available subscriptions.
subscription-manager list --available --matches '*OpenShift*'

# find the pool ID for an OpenShift Container Platform subscription and attach it:
subscription-manager attach --pool=<pool_id>

# Enable only the repositories required by OpenShift Container Platform 3.11. By executing the command, it tells the RHEL that the tools required to install openshift Enterprise will be available from these repositories:
subscription-manager repos \
    --enable="rhel-7-server-rpms" \
    --enable="rhel-7-server-extras-rpms" \
    --enable="rhel-7-server-ose-3.11-rpms" \
    --enable="rhel-7-server-ansible-2.9-rpms"
    
# Install base packages:
yum install wget git net-tools bind-utils yum-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct
yum update
reboot
yum -y install openshift-ansible
yum -y install docker

# Configuring storage driver for docker:
vi etc/sysconfig/docker-storage-setup
change the STORAGE_DRIVER=overlay2
docker-storage-setup
systemctl enable docker.service
systemctl start docker

# Ensure selinux is enabled:
vi /etc/selinux/config
SELINUX=enforcing
SELINUXTYPE=targeted

# Generate keys on the ansible controller machine and then copy the id_rsa.pub key to the authorized key file of the node machine, which can be done using the following command
ssh-keygen
ssh-copy-id -i .ssh/id_rsa.pub root@ose3-node.example.com

# Create an inventory file

# Execute the playbook from ansible controller machine:
ansible-playbook -i <path of inventory file> openshift-ansible/playbooks/prerequisites.yml
ansible-playbook -i <path of inventory file> openshift-ansible/playbooks/deploy_cluster.yml
