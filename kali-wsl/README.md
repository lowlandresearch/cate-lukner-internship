# Kali Linux Installation Documentation
#### Cate Lukner
#### Time spent on this task: May 18th, 2020 - 9:00AM to 9:45AM (45 min) 

I used the following website as a reference for installation:
https://www.kali.org/news/kali-linux-in-the-windows-app-store/

## Step 1: Enable and Install the App
First, I had to enable a Linux subsystem on my Windows computer. I did so by typing the following command into Powershell as an Admin and restarting my computer:
```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```
After my comptuer restarted, I went to the Windows App store, searched for Kali Linux, and downloaded the App.
This step was straightforward and I encountered no problems.

## Step 2: Updating Kali Linux 
The updating process was a little less straightforward, but not bad. The commands listed on the website I am referencing `apt-get update` and `apt-get dist-upgrade` would only work if I put `sudo` before them. Otherwise, I would get permission denied errors. It took watching the video to figure this out. Per the video's suggestion, I also ran `sudo apt-get clean` to clean the apt-cache and save space on my drive.

## Step 3: Installing Penetration Testing tools on Kali
The website notes to install tools from the Kali Linux repository, I would simply use `apt` commands. To try out installing a tool, I installed the Metasploit Framework using the following commands:
```
sudo apt-get update
sudo apt-get install metasploit-framework
```

## Step 4: Revovering from a failed Kali WSL instance
Since I have nothing to loose on my Kali WSL instance, I decided to walk through the reset of Kali as directed by the video on the website. Pretending I did something that caused me to kill my Kali WSL instance, I went to Settings -> Apps and Features -> Kali -> Advanced Options -> Reset.
Once I reset Kali Linux, I ran through all the commands again I documented in Steps 2. I did not go through Step 3 again since I currently do not have use for the Metasploit Framework (but have the command to install in the future, if necessary).    

