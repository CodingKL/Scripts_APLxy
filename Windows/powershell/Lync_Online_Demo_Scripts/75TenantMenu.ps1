if ($ex) {logit "exit from 75";
    exit;}
<# select the service to manage#>
<#Do we already have a session?#>

<#Is the session active?#>
$st=Get-pssession;
if ( (-NOT $st.State) -OR ($st.State -ne "Opened") ) {
      if ($st) {remove-pssession $session;}
      logit "Session has timed out - Please restart the session";
      .\Demo.ps1
}

$cmf="DarkRed"
$cmb="DarkGray"
$choice = -1

<#=======================================================#>
<# Tenant Menu                                           #>
<# User can manage Tenant-Specific options               #>
<#=======================================================#> 
   
    <#$global:tnt=$ten.DisplayName;#>
    $global:titre=$tnt + "                                                             ";
    $title=$titre.substring(0,50);
    write-host -backgroundColor darkBlue -foregroundcolor Gray "$title";
    write-host -backgroundColor darkBlue -foregroundcolor Gray "  MENU 75                              Tenant Menu"
    write-host -backgroundColor darkBlue -foregroundcolor Gray "                                                  "
	
	
    write-host -backgroundColor darkBlue -foregroundcolor Gray "  Lync Online                                     "
    write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [1] Lync Online Get-Command `$modname           "
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [2] Get-CsOnlineUser  (List of Aliases)        "
    write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [3] Manage a User                              "
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [4] Manage a Group                             "
   write-host -backgroundColor darkBlue -foregroundcolor Gray "  O365 - Windows Azure - Active Directory         "
    write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [5] Office 365 Get-Command                     "
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [6] Office 365 User list                       "
		write-host -backgroundColor darkBlue -foregroundcolor Gray "  Exchange Online                                 "
    write-host -backgroundColor $cmb -foregroundcolor $cmf    "   [7] Exchange P2P Summary Report                "
      
    write-host -backgroundColor darkBlue -foregroundcolor Gray "   e[X]it                                         "
	      write-host -NoNewLine                                      "   >"
 
    while ($choice -NotIn "1","2","3","4","5","6","7","X","B","H") { 
            $choice=read-host
    }
    logit "Menu 75 Selection = $choice"
    if (($choice -eq "x") -OR ($choice -eq "X")){
        $global:ex = 1;
        exit;
    }
    
    switch ($choice)
    {

    <#=======================================================#>
    <# List Commands for this Tenant                         #>
    <#=======================================================#> 

        1{  logit "Get-Command -Module $modname.name"
            
            $i=0;
            Get-Command -Module $modname.Name | foreach {
                write-host "  [" -nonewline; 
                if ($i -lt 9) {
                    write-host " " -nonewline;
                }
                write-host (++$i) -nonewline; 

                write-host "]",$_.Name 
            }
        

            logit "...done "
           
            
        }
    <#=======================================================#>
    <# List Users for this Tenant and count them             #>
    <#=======================================================#> 

        2{  logit "Get-CSOnlineUser | Format-table -property "   ", alias, Conferencingpolicy"
            $counter=0;
            write-host "     Alias                  Conferencing Policy"
            write-host "     ==========             ==================="

            Get-CSOnlineUser | foreach {
            <#$global:tnt=$ten.DisplayName;#>
            $PadAlias =$_.alias + "                                     ";
            $PadAlias = $PadAlias.substring(0,20);
            write-host "    ",$PadAlias, " ",$_.conferencingpolicy
            $counter = $counter+1;
        }
        write-host "     ===========   ";
        write-host "     Total = $counter";
        write-host " ";
                        
        logit " ... done"
        }


    <#=======================================================#>
    <# Select a User to Manage                               #>
    <#=======================================================#> 

        3{  
            write-host -nonewline -foregroundcolor gray "  Enter Alias <default is:$defuser>"
            <#Get User to manage#>
            <#Future: error check the user#>
            $Global:TheUser = read-host;
            if (-NOT $TheUser) {$TheUser = $defuser}
            logit "Manage $TheUser"
            .\82User.ps1
            
        }
    <#=======================================================#>
    <# Manage All Users or groups                            #>
    <#=======================================================#> 

        4 {  
            
            logit "Group Management"
            .\85Group.ps1
        }
    <#=======================================================#>
    <# List MSOL Commands                                    #>
    <#=======================================================#> 

        5{  logit "Get-Command -Module MSOnline";
            Get-Command -Module MSOnline | Format-Table -Property Name; 
        }

    <#=======================================================#>
    <# List users/licenses                                   #>
    <#=======================================================#> 

        6{  
            logit "get-msolUser | format-table -property DisplayName, Department, ExperiencePolicy, licenses -autosize"
            get-msolUser | format-table -property DisplayName, Department, licenses -autosize
            logit "Office 365 License Information"
            logit "Get-MsolAccountSku | format-table -property ConsumedUnits, ActiveUnits -autosize"
            Get-MsolAccountSku | format-table -property ConsumedUnits, ActiveUnits -autosize        
            
        }

    
    
    
    <#=======================================================#>
    <# Exchange P2P Usage Report                             #>
    <#=======================================================#> 

        7{  logit "Get-CsP2PSessionReport";
            Get-CsP2PSessionReport | Format-table -property date,TotalP2PSessions,P2PIMSessions,P2PAudioSessions -autosize;
          
          

        }
    
    <#=======================================================#>
    <# Display Command Help                                  #>
    <#=======================================================#> 
    
    
        "H" {
            logit "Command Help"
            .\42Help.ps1
      
        }

        
    <#=======================================================#>
    <# Exit or move back                                     #>
    <#=======================================================#> 
    	

    "X" {
            logit "Exit Menu 75";
            exit;
	  }

    "B" {
            
            logit "Exit Menu 75 Back to 71";
            .\Demo.ps1;
	  }

        default {            
	    write-host -ForegroundColor Yellow "  $(Get-Date -Format s)-> Unexpected Value";
	    exit;}
}

.\75TenantMenu.ps1