# Powershell1
Creation of Active Directory Users with Automated Powershell Script

## Description

This project consists of several Powershell scripts that automate the process of creating user accounts in Active Directory that would normally be done during onboarding. For a more in-depth, step-by-step description of this project, please visit my [blog post](https://pattychungcouk.wordpress.com/2023/11/06/active-directory-lab-creating-a-virtualized-network-with-dns-ras-nat-dhcp%ef%bd%9cconnecting-client-machine-to-domain%ef%bd%9c-creating-ous-users-with-powershell/). 

### Setting up the Environment 
Here are the actions I took to set up my network and environment for Active Directory.
![1 - network design](https://github.com/pattytechuk/Powershell1/assets/167561785/e805702a-84c4-4af5-aab6-a854e5dce6ee)

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
- Joined Client Machine (Windows 10) to domain

### Creating Organizational Units (OUs) via Powershell

I created four departments for the company i.e. OUs - Accounting, Marketing, Agents, and HR. 
![27 - Powershell Creating OU](https://github.com/pattytechuk/Powershell1/assets/167561785/2fd25077-a738-4295-8610-ca9f9f380462)

### Creating Users Manually through Active Directory GUI

Windows Server Manager > Tools > Active Directory Users and Computers
Right clicking on each OU I selected New > User and then filled in first and last name for each user. 
![19 - Manual User Creation in GUI](https://github.com/pattytechuk/Powershell1/assets/167561785/3e65970d-722a-4a3f-92d2-cd846f8562e5)

### Creating Users in Powershell Using a ForEach Loop

I used a script that pulled names from a text file I created with 100 employee names.
![23 - Powershell Script 1](https://github.com/pattytechuk/Powershell1/assets/167561785/95e56f46-f410-4ffa-9fb0-dec16d44ff81)
![24 - Powershell Script 2](https://github.com/pattytechuk/Powershell1/assets/167561785/63ae238d-d2a3-47f1-8f98-820882b5de38)

### Creating Users and Assigning to OUs with Automated User Entry

Using the 'New-ADUser' Powershell commandlet, I used the following script to build an automated script to prompt for the first name, last name, username, and password.
![30 - Powershell Script automated user entry 1](https://github.com/pattytechuk/Powershell1/assets/167561785/44c66dcd-8434-4381-af24-9561e1da72e3)
![33 - Powershell Accounting Script 2](https://github.com/pattytechuk/Powershell1/assets/167561785/facc5e40-a874-45dc-bbc5-21335c4ccf97)




