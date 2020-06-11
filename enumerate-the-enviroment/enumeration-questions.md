# Enumerate the Enviroment Questions

- Note: All the reachable hosts from nmap's ping scan are in the directory `reachable` while all the http webservers are in `webservers` directory. 

Answer the following questions:
* How many Windows hosts are there?
From all the reachable hosts from nmap's ping scan, there are 9 windows hosts.  
From all the http webservers, there are 6 windows hosts.  

* What are the OS versions of the Windows hosts?
From the http webservers and reachable hosts, each of the hosts' nmap scan includes this:
```
PORT     STATE SERVICE       VERSION
80/tcp   open  http          Microsoft IIS httpd 10.0
```
Thus, I believe this means the Windows hosts are running version Microsoft IIS httpd 10.0. 
It is the same case with all the reachable hosts, expect for one host that is running multiple OSs and uses the version `ISC BIND 9.8.2rc1 (RedHat Enterprise Linux 6)`. 

* How many non-Windows hosts are there?
From all the http webservers, there are 9 non-Windows hosts.
From all the hosts from nmap's ping scan, there are 24 non-Windows hosts. 

* What are your best guess at their OS?
When I observe the http webservers, my best guess based on their OS is FreeBSD or Unix. From the nmap scan with OS dection among other things, there is also results showing FreeBSD, which is a Unix-like operating system. There are also results showing hosts with Unix. Aditionally, there is one host running AOS operating system (10.0.0.254). 
When I observe all the reachable hosts, my guess is the same as before with the http webservers. However, there is one host running Linux (10.0.0.24) and another host running AOS (10.0.0.254). 