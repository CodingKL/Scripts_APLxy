Remote PowerShell for Lync Online
Menu-Based Demo Script v1
************
Disclaimer: 
************
These scripts are provided for educational purposes only. There is no implied guarantee they will work as stated. 
Neither the author of these scripts nor his employer (Microsoft) are liable for any harm, damage or loss of revenue caused by the use of these scripts.

***************
Pre-requisites: 
***************
Please follow the installation and configuration instructions located here: http://technet.microsoft.com/en-us/library/dn362831.aspx.
In order to run these scripts: 

1. You are running Windows 8 or 8.1
2. You have a valid Tenant and have Admin Priviledges
3. You have downloaded and installed the Lync Online Remote Powershell Connector: http://www.microsoft.com/en-us/download/details.aspx?id=39366
4. Your .Net framework must be version 4.5 or later (as should be the case for Windows 8+): http://www.microsoft.com/net/
5. You have installed the Microsoft Online Services Sign-In Assistant for IT Professionals RTW: http://www.microsoft.com/en-us/download/details.aspx?id=28177
6. You have installed the Windows PowerShell module for Windows Azure Active Directory: http://go.microsoft.com/fwlink/p/?linkid=236297

***************
Instructions:
***************
1. Create a directory to contain the scripts
2. Copy the scripts into this directory: 
	0Start.ps1
	1Demo.ps1
	75Tenantmenu.ps1
	82User.ps1
	85Group.ps1
	92Conf.ps1
	logit.ps1

3. Edit 0Start.ps1 and change the variables to reflect your username, tenant and installation directory etc.
	- The scripts also assume you have a department called 'Technical Marketing'. This can be changed to something else.
	  If you don't need to demo group changes you can ignore this. If you do want to demos these changes then you can use 
          the Office 365 Admin center to add department settings to your user accounts
4. Run 0Start.ps1 as Administrator
- I like to run my demos using an icon on my desktop. To accomplish this:

          a. Right click your Windows desktop, point to New, then click Shortcut.
          b. Browse to: C:\Windows\System32\WindowsPowerShell\v1.0 and select PowerShell.exe.
          c. Give your new shortcut a name (i.e., Lync Online Demo Scripts) and then click Finish.
          d. Right click the new desktop icon and then click Properties.
          e. Edit the Start in field as follows: 
                  C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -noexit c:\users\YOURUSERNAME\documents\YOUR_SCRIPT_DIRECTORY\0Start.ps1
             For example, if you saved the scripts the folder C:\Scripts you would type the following command:
                  C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -noexit C:\Scripts\0Start.ps1
             Note that you may also want to change the display settings, using a wider screen and a larger font for demos.
          f. Click Advanced, select Run as administrator, and then click OK. If you do not run windows PowerShell as an Administrator then 
             the script will fail with the following error message:
                  WARNING: ...this doesn't feel right
                  WARNING: Recommendation: Exit and run as Administrator
          g. Click OK.

    
************
Description: 
************
This Demo script has been assembled to help you demonstrate the basic functionality of the Remote Windows Powershell. 
The system uses menus to guide you through the demo; if you select the appropriuate option, the commands. along with 
the resulting output, will bedisplayed on the screen.
Commands are also time-stamped and stored in a file called logfile.txt.

- The 0Start script sets up the environment and global variables.

- The Demo script allows you to log into your tenant by prompting you for credentials, opening a session and importing all the commands 
	(Note:this can take about a minute, so it's worth logging in and then describing what's going on)
	It will load: Lync Online, Active Directory for o365, Exchange connectors

- The 75TenantMenu lets you:
   1 Display the imported commands
   2 List your users
   3 Manage single user settings
   4 Manage groups or All users
   5 Display the change log

- The 82Users is for managing a specific user - you need to enter an alias to manage (there is no error correcting on this, so get it right)
  This menu also enables you to:
   1 Display the user settings (this list is long so you will need to scroll back to show it all)
   2 Display a formatted subset of the user's settings
   3 List the available Conferencing policies
   4 Display the details behind a specific conferencing Policy Instance (you will need to explain Policy Instances here)
   5 Manage policy instances for a specific user (calls 92User.ps1)
   6 Display the blocked domain list - explain how the blocked list works   
   7 Add a domain to the blocked list - add something like contoso.com
   8 Remove a domain from the blocked list
    [B] to go back up to 75TenantMenu 

- the 92Conf script lets you allocate Policy Instances to a specific user. By default this will use the user you set in the global variable $defuser in 0Start.ps1

- The 85Group is used to manage group settings. From here you can:
   1 Display the conferencing policy for all your users (this also displays department names)
   2 Grant all to 'Technical Marketing' - I've hard-coded this in so you will want to change the code or setup a few users with this dept name using admin Center (it can be done with Set-Msoluser in the O365 remote powershell but that's not in the scope of this demo)
   3 Grant all except video to 'Technical Marketing'
   4 Grant all conferencing modes to all users
   5 Grant all except video to all users
   [B]ack to 75Tenant Menu
