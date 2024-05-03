# Powershell1
Creation of Active Directory Users with Automated Powershell Script

## Description

This project consists of several Powershell scripts that automate the process of creating user accounts in Active Directory that would normally be done during onboarding. 

Here are the actions I took to set up my network and environment for Active Directory.

- Installed Oracle VirtualBox as the hypervisor to manage all VMs for this lab.
- Loaded Windows Server 2019 and Windows 10 client machine into VirtualBox
- Configured the Windows Server 2019 VM  with two network adapters
- Used Server Manager to create a new domain, added a new forest, assigned the server as domain controller
- Configured AD DNS 
- Installed Remote Access Server to allow clients on private network to be routed to the outside Internet through the domain controller
- Opened Remote Access and Routing Set Up Wizard in Windows Server Manager and enabled NAT to allow internal clients to connect to the Internet
- Checked that routing and remote access is up and running on DC
- Installed and configured DHCP on domain controller to allow clients connected to the domain to automatically receive an IP address.
- Set up IP address ranges in DHCP server pools to ensure the first machine gets assigned IP address
  
