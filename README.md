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
  <li><a href="#lvm-partitions">Creating Two Partitions Using LVM</a></li>
  <li><a href="#apt-vs-aptitude">What is the Difference Between apt and aptitude</a></li>
</ul>

## chapter 3:
<ul>
  <li><a href="#introduction-ssh">What Is SSH Key</a></li>
  <li><a href="#ssh-configuration">SSH Configuration</a></li>
  <li><a href="#setup-ufw">Setup UFW</a></li>
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
call the <strong>Disk Signature</strong>.<br> <br>
<strong>How Can I Get My Disk Signature?</strong> <br>
<br> When you create a VM, VirtualBox generates a file with the extension <strong>.vdi</strong>, 
like <strong>ubuntu.vdi</strong>. This file contains all your data (files, applications, etc.).
<br> <br> 
<strong>Note: There is also a file called <strong>ubuntu.iso</strong>, which is just for
installing the operating system.</strong> <br> 
<br> So, the task is to find this file
<strong>ubuntu.vdi</strong> because this file represents the disk space allocated to the virtual machine.<br> 
<br> To find this file:</p> <p><strong>Open a terminal and run this command:</strong><br></p> 

```bash
VBoxManage showhdinfo /path/to/file.vdi
```

<strong>If you do not know the path to the file.vdi, run this command:</strong>

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

<strong>for install AppArmor</strong>
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

<p>So now let's create partitions by using the following commands:</p>
<p><strong>Installing LVM and the tool for encrypting the spaces:</strong></p>

``` bash
sudo apt install lvm2
```

``` bash
sudo apt install cryptsetup
```

<p><strong>Define the disk and space that will be used for LVM:</strong></p>

``` bash
lsblk  # see the available disk (in my case I am using /dev/sda)
```

``` bash
sudo fdisk /dev/sda
```

<p><strong>Taking the space for LVM:</strong></p>

<p>By running the following commands, you will see a menu:</p>

``` bash
n: create new space
p: for primary space
3: assign a number to this space
w: save & exit
```

<p><strong>By following this command, you will create space for LVM. In my case, I created two spaces on /dev/sda with a total storage of 100GB, and also created /dev/sda3 and /dev/sda4.</strong></p>

<p>Now, let's encrypt these two spaces represented by the files <strong>/dev/sda3</strong> and <strong>/dev/sda4</strong>.</p>

<p><strong>Encryption of /dev/sda3 and /dev/sda4:</strong></p>

``` bash
sudo cryptsetup luksFormat /dev/sda3  # encrypt /dev/sda3
sudo cryptsetup luksFormat /dev/sda4  # encrypt /dev/sda4
sudo cryptsetup open /dev/sda3 crypt_sda3  # open encryption for /dev/sda3
sudo cryptsetup open /dev/sda4 crypt_sda4  # open encryption for /dev/sda4
```

<p><strong>Create Physical Volumes (PVs) for LVM:</strong></p>

``` bash
sudo pvcreate /dev/mapper/crypt_sda3 /dev/mapper/crypt_sda4
```

<p><strong>Create Volume Group (VG):</strong></p>

``` bash
sudo vgcreate my_vg /dev/mapper/crypt_sda3 /dev/mapper/crypt_sda4
```

<p><strong>Create Logical Volumes (LVs) inside the Volume Group (VG):</strong></p>

``` bash
sudo lvcreate -L 50G -n lv1 my_vg  # create the first partition of 50GB
sudo lvcreate -L 50G -n lv2 my_vg  # create the second partition of 50GB
```

<p><strong>By following these commands, you will create two partitions, each with a size of 50GB.</strong></p>





## What is the Difference Between apt and aptitude
<a name="apt-vs-aptitude"></a>
<p><b>apt:</b> is an easy tool to manage software, install packages, and update the system.</p>
<p><b>Aptitude:</b> is an older tool that does the same things as <b>apt</b>, but with more features and options.</p>



## What Is SSH Key?
<a name="introduction-ssh"></a>
<p><b>SSH(Secure Shell):</b> is tool that lets you connect machine A with machine B via shh.
if we use machine A to connect With machine B, you can acess to filies and every exit in machine B.<br></p>
<p>fo connecting two computer or machines we should be some imporant basics that are: machines connecto via port.<br>
<b>Port:</b>is special address in your computer where data can enter or leave.(we are going to ducess this in next parts)</p>

<p><b>NOTE: I am using mint distro in my mean machine (machine A), and mint Distro in my VM (machine B).</b></p>



## SHH Configuration
<a name="ssh-configuration"></a>
<p>in this part we should be configure ssh by tell to the computer wich address or (port)
can data come or leave wich means we should set up port. the port used is 4242</p>

<p><b>installing ssh:</b></p>

``` bash
sudo system ctl status ssh // you can see ssh could not be found
sudo apt update // for updating the packages in linux
sudo apt install openssh-server // install ssh
sudo apt reinstall openssh-server // Reinstalls SSH server.
```

<p><b>setUP Port:</b></p>

``` bash
sudo nano /etc/sshd_config // find the line "#Port 22" --> change to "Port 4242"
sudo service ssh restart // restart the ssh
sudo lsof -i -P -n | grep ssh // You must see thing like this --> TCP *:4242 (LISTEN)

``
<p><b>Problems</b></p>
<p>if you find a problem or ssh use port 22. that may be your ssh controleed byt ssh.socket
to solve it run this folowwing commands</p>

``` bash
sudo systemctl disable ssh.socket // To disable SSH controlled by ssh.socket
sudo systemctl disable ssh.socket // To disable SSH controlled by ssh.socket
sudo systemctl restart ssh // restart ssh
sudo lsof -i -P -n | grep ssh // You must see thing like this --> TCP *:4242 (LISTEN)
```

<p><b>NOTE: Setup Port Must Be In Both Machines (machine A & machine B)</b></p>



## Setup UFW
<a name="setup-ufw">/a>





























