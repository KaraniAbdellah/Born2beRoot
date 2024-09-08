# Born2beRoot

# Table of Contents
## chapter 1:
<ul>
  <li><a href="#introduction-ch1">Introduction</a></li>
  <li><a href="#virtual-machine">What is a Virtual Machine?</a></li>
  <li><a href="#how-vms-work">How do Virtual Machines work?</a></li>
  <li><a href="#install-vbox">Installing VBox And SetUp Your OS</a></li>
  <li><a href="#disk-signature">How To Get Disk Signature Of Your VM?</a></li>
</ul>
  
## chapter 2:
<ul>
  <li><a href="#install-vbox">Create Partitions Using LVM Tool</a></li>
  <li><a href="#lvm-partitions">Creating Two Partitions Using LVM</a></li>
  <li><a href="#apt-vs-aptitude">What is the Difference Between apt and aptitude</a></li>
</ul>

## chapter 3:
<ul>
  <li><a href="#introduction-ssh">What Is SSH Key?</a></li>
</ul>


## Introduction
<a name="introduction-ch1"></a>
<p>In this project you will enter the wonderful world of virtualization by creating your first virtual machine,
and at the end of this project you will be able to set up your operating system.</p>


## What is a Virtual Machine?
<a name="virtual-machine"></a>
<p>The simple definition is: A virtual machine (VM) is a simulated computer within another computer. 
It’s like a “virtual” computer inside your physical computer, and you can put another operating system 
in this virtual machine. A virtual machine also takes resources from your main computer, like CPU, memory,
and disk space, and you can allocate any resource you want to your VM. To create your virtual machine, 
you need an application like <strong>VirtualBox</strong>(<strong>UTM</strong> if you have macOS).</p>


## How do Virtual Machines work?
<a name="how-vms-work"></a>
<p>Imagine you have a big computer. Virtualization allows you to create a virtual machine (VM) inside this computer, and you can install an operating system in this VM. However, the VM needs some resources from the physical computer, so there are special programs called <strong>hypervisors</strong> that control everything. These programs manage and allocate resources from the physical computer to the VM. Once resources are assigned, you can install any operating system inside the VM.</p>


## Install VBox and Create VM
<a name="#install-vbox"></a>
[Content for Install VBox and Create VM]


## How To Get Disk Signature Of Your VM?
<a name="disk-signature"></a>

<p>We already said that you need to allocate some resources to your virtual machine, such as 
CPU, memory, and disk space. The disk space allocated to this VM has a special ID we
call the <strong>Disk Signature</strong>.<br> <strong>How Can I Get My Disk Signature?</strong>
<br> When you create a VM, VirtualBox generates a file with the extension <strong>.vdi</strong>, 
like <strong>ubuntu.vdi</strong>. This file contains all your data (files, applications, etc.).
<br> <strong>Note: There is also a file called <strong>ubuntu.iso</strong>, which is just for
installing the operating system.</strong><br> So, the task is to find this file
<strong>ubuntu.vdi</strong> because this file represents the disk space allocated to the virtual machine.
<<<<<<< HEAD
<br> To find this file:</p> <p><strong>Open a terminal and run this command:</strong><br></p> 
```bash
VBoxManage showhdinfo /path/to/file.vdi
```
<p>If you do not know the path to the file.vdi, run this command:</p> 
```bash
=======
<br> To find this file:</p> <p><strong>Open a terminal and run this command:</strong><br></p>

``` bash
VBoxManage showhdinfo /path/to/file.vdi
```
<p>If you do not know the path to the file.vdi, run this command:</p>

``` bash
>>>>>>> 6ae67d574342e317afd41d58ca5e9727bbfd23a3
find ~/VirtualBox\ VMs/ -name "*vdi"
```

<p>After running this command, look for output that contains 
<strong>UUID: jhcyhc89cqhcqud...</strong>. This is your disk signature.</p>


## Secure Your System By Using Tool Like AppArmor
<a name="secure-system"></a>
[Content for Secure Your System By Using Tool Like AppArmor]


## Creating Two Partitions Using LVM
<a name="lvm-partitions"></a>
[Content for Creating Two Partitions Using LVM]


## What is the Difference Between apt and aptitude
<a name="apt-vs-aptitude"></a>
[Content for What is the Difference Between apt and aptitude]


## What Is SSH Key?
<a name="introduction-ssh"></a>
[Content Of What Is SSH]


























