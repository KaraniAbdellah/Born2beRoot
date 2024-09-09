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
<a name="install-vbox"></a>
<p>Here are some resources that can help you: <br>
<strong>Installing VBox on macOS:</strong> <a href="https://youtu.be/hd0Lbtly41Y?si=_xS0wlXFEHyqEZIt">https://youtu.be/hd0Lbtly41Y?si=_xS0wlXFEHyqEZIt</a> <br>
<strong>Installing VBox on Windows:</strong> <a href="https://youtu.be/8mns5yqMfZk?si=cAlLDM5fjiUn_AY-">https://youtu.be/8mns5yqMfZk?si=cAlLDM5fjiUn_AY-</a> <br>
<strong>Installing VBox on Linux:</strong> <a href="https://youtu.be/CIq2obbg94I?si=hX7RGD2jHiFmyvrA">https://youtu.be/CIq2obbg94I?si=hX7RGD2jHiFmyvrA</a> <br>
<strong>Installing Ubuntu on VBox:</strong> <a href="https://youtu.be/hYaCCpvjsEY?si=73U42FgE1YklFh4D">https://youtu.be/hYaCCpvjsEY?si=73U42FgE1YklFh4D</a> <br> <br>
<strong>Note: If you choose another OS, search for how to install it.</strong>
</p>



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
<br> To find this file:</p> <p><strong>Open a terminal and run this command:</strong><br></p> 

```bash
VBoxManage showhdinfo /path/to/file.vdi
```

<p>If you do not know the path to the file.vdi, run this command:</p>

```bash
find ~/VirtualBox\ VMs/ -name "*vdi"
```

<p>After running this command, look for output that contains 
<strong>UUID: jhcyhc89cqhcqud...</strong>. This is your disk signature.</p>
<strong>Note: all commands should run it in you main machine not in your VM</strong>



## Secure Your System By Using Tool Like AppArmor
<a name="secure-system"></a>
<p>To Secure Your System Like ubuntu, arch-linux ... we need a tool that can secure this system.
so there is many tool like (AppArmor, SElinux), so all this tool is to protect your system
by controlling what programm can access. and also this tool working in background. <br>
For Me <strong>I am Using AppArmor</strong>. so setUp AppArmor Use The Follwing Commands:<br></p>

<strong>For Install AppArmor</strong>
``` bash
sudo apt install apparmor apparmor-utlis
```

<strong>for enable and start using apparmor</strong>

``` bash
sudo systemctl enable apparmor
sudo systemctl start apparmor
```

<strong>for check the status</strong>

``` bash
sudo systemctl status apparmor
```



## Creating Two Partitions Using LVM
<a name="lvm-partitions"></a>
<p>After creating partitions, it's important to understand what is <strong>LVM (Logical Volume Manager).</strong></p>

<p><strong>LVM</strong> is a tool that manages disk partitions with more flexibility. In simpler terms, it allows you to create partitions from your physical disk, meaning you can access and manage your disk space more efficiently. We'll explain this in the following parts.</p>

<p><strong>Important Concepts:</strong></p>
<p><strong>PV (Physical Volume):</strong> This is your actual hard drive, like an HDD or SSD.</p>
<p><strong>VG (Volume Group):</strong> This is a pool of space created from one or more Physical Volumes (PVs).</p>
<p><strong>LV (Logical Volume):</strong> This is the partition or space that you create from the Volume Group (VG).</p>
<p><strong>Example:</strong></p>

<p>Suppose your machine has two disks, a <strong>HDD (256GB)</strong> and a <strong>SSD (256GB)</strong>, and you want to create a partition using LVM. To do this, you take space from both disks to use with LVM. For example, you decide to work with 100GB, taking 50GB from the HDD and 50GB from the SSD.</p>

<p>Next, you create a <strong>Volume Group (VG)</strong> using LVM. This Volume Group is like a box that holds the 100GB of space. Inside this box (VG), you can then create a <strong>Logical Volume (LV)</strong>, which will be your partition.</p>

<p>In summary, the process is to:</p>
<p>1. Identify the space you want to work with in LVM.<br>
2. Create a <strong>Volume Group (VG)</strong> with that space.<br>
3. Inside the Volume Group, create a <strong>Logical Volume (LV)</strong>.</p>

<p><strong>Note:</strong> After creating the partition, it's important to encrypt the 100GB you allocated to LVM for security. Encryption helps protect your data.</p>




## What is the Difference Between apt and aptitude
<a name="apt-vs-aptitude"></a>
[Content for What is the Difference Between apt and aptitude]



## What Is SSH Key?
<a name="introduction-ssh"></a>
[Content Of What Is SSH]


























