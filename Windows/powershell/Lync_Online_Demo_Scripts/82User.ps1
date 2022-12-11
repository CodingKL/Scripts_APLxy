if ($ex) {exit;}
<# set the menu colors#>
$cmf="DarkRed"
$cmb="DarkGray"
$choice = -1

<#======================================================#>
<# User Managwement Menu to select the service to manage#>
<#======================================================#>

    

    $global:titre=$tnt + " - " + $TheUser + "                                              ";
    $title=$titre.substring(0,52);
    write-host -backgroundColor darkBlue -foregroundcolor Gray "$title";
    write-host -backgroundColor darkBlue -foregroundcolor Gray "  MENU 82                           User Management "
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [1] Display User Settings - unformatted          "
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [2] Display User Settings - formatted            "
    
    write-host -backgroundColor darkBlue -foregroundcolor Gray "                                       Conferencing "
    write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [3] List Available Conferencing Policy instances "	
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [4] Display Conferencing Policy Instance details "
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [5] Manage Conferencing Policy                   "
	
	
    write-host -backgroundColor darkBlue -foregroundcolor Gray "                                            Domains "
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [6] Display the Blocked domain list              "

	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [7] Add a Domain to the blocked list             "
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [8] Remove a Domain from the blocked list        "

       
    write-host -backgroundColor darkBlue -foregroundcolor Gray "   [B]ack e[X]it                                    "
	

    while ($choice -NotIn "1","2","3","4","5","6","7","8","B","X") { 
            write-host -NoNewLine "   >"
            $choice=read-host;
            
    }
    logit "Menu 82 Selection = $choice"
    if (($choice -eq "x") -OR ($choice -eq "X")){
        $global:ex = 1;
        logit "exit from 82User.ps1"
        exit;
    }
   
    <#switch#>
    switch ($choice)
    {        
        <#------------------------------#>
        <# Display the raw user settings#>
        <#------------------------------#>

        "1"{ 
            logit "Get-CSOnlineUser -Identity $TheUser | more" 
            Get-CSOnlineUser -Identity $TheUser | more
            .\82User.ps1;
            
        }
        <#------------------------------------#>
        <# Display an extract of user settings#>
        <#------------------------------------#>

        "2"{  

            logit "`$userdata = Get-CSOnlineUser $TheUser"; 
            logit "`$userdata.FirstName etc..."; 
            
            $userdata = Get-CSOnlineUser -Identity $TheUser;
            Write-Host -NoNewLine -ForegroundColor DarkYellow "    First Name: "; $userdata.FirstName;
            Write-Host -NoNewLine -ForegroundColor DarkYellow "    Last Name: "; $userdata.Lastname;
            Write-Host -NoNewLine -ForegroundColor DarkYellow "    Alias: " ;$userdata.Alias;
            Write-Host -NoNewLine -ForegroundColor DarkYellow "    SIP Address: "; $userdata.SIPAddress;
            Write-Host -NoNewLine -ForegroundColor DarkYellow "    Conferencing Policy: "; $userdata.ConferencingPolicy;
            Write-Host -NoNewLine -ForegroundColor DarkYellow "    Registrar Pool: "; $userdata.RegistrarPool;

                                    
            .\82User.ps1
        }
      
        <#--------------------------------------------------#>
        <# List the available policy instances for this user#>
        <#--------------------------------------------------#>

      "3" {
            
            logit "Get-CSConferencingPolicy | ?{`$_.Identity -like `"*$PolList*`"} | format-table -property Identity -autosize"
            Get-CSConferencingPolicy | ?{$_.Identity -like "*$PolList*"} | format-table -property Identity -autosize

            logit "done"
            .\82User.ps1
        }

        <#---------------------------------------------------#>
        <# What does this policy instance mean?              #>
        <# First: get this user's policy Instance            #>
        <# Second: Display the details                       #>
        <#---------------------------------------------------#>

      "4"{  
            logit "`$userdata = Get-CSOnlineUser `$TheUser"; 
            $userdata = Get-CSOnlineUser $TheUser;
            $PolInstance = $userdata.ConferencingPolicy;
            logit "Conferencing Policy: $PolInstance";
            
            logit "Get-CSConferencingPolicy –Identity $PolInstance" 
            Get-CSConferencingPolicy –Identity $PolInstance | more
            
            .\82User.ps1
        }
        <#---------------------------------------------------#>
        <# Manage all Policy Instances for a specifc user    #>
        <#---------------------------------------------------#>

        "5"{  
            logit "Manage Conferencing Policy for $TheUser"
            .\92Conf.ps1
            
        }

                
        <#---------------------------------------------------#>
        <# List the Blocked Domains                          #>
        <#---------------------------------------------------#>

        "6"{  
        
            Logit "Get-CsTenantFederationConfiguration | Select-Object -ExpandProperty BlockedDomains"
            $Bl=Get-CsTenantFederationConfiguration | Select-Object -ExpandProperty BlockedDomains
            Write-host " "
            $Bl.Domain
            Write-host " "
            logit "... done"
          
            .\82User.ps1
        }
        
        <#---------------------------------------------------#>
        <# Add a domain to the blocked domain list           #>
        <#---------------------------------------------------#>
        "7" {   write-host -nonewline "Enter Domain to block> "
                $UserDomain =read-host
                logit "get-cstenant"
                $t=get-cstenant;
                $tenid=$t.tenantid

                logit "`$NewEdge=New-CsEdgeDomainPattern -Domain $UserDomain"
                $NewEdge = New-CsEdgeDomainPattern -Domain $UserDomain
                logit "Set-CsTenantFederationConfiguration -Tenant `$tenid.guid -BlockedDomains @{Add=`$NewEdge}"
                Set-CsTenantFederationConfiguration -Tenant $tenid.guid -BlockedDomains @{Add=$NewEdge}
            
                Write-host " "
                Logit "New list of Blocked Domains"
                write-host " "
                (Get-CsTenantFederationConfiguration | Select-Object –ExpandProperty BlockedDomains).Domain
                 write-host " "
                .\82User.ps1

        }
        <#---------------------------------------------------#>
        <# Remove a domain from the blocked domain list      #>
        <#---------------------------------------------------#>

        "8" {   $t=get-cstenant;
                logit "get-cstent"
                $tenid=$t.tenantid
                logit "List of Currently blocked domains"
                (Get-CsTenantFederationConfiguration | Select-Object –ExpandProperty BlockedDomains).Domain
        
                write-host -nonewline "Select a Domain to remove >"
                $UserDomain =read-host
                
                logit "`$NewEdge=New-CsEdgeDomainPattern -Domain $UserDomain"
                $NewEdge = New-CsEdgeDomainPattern -Domain $UserDomain
                
                logit "Set-CsTenantFederationConfiguration -Tenant `$tenid.guid -BlockedDomains @{Remove=`$NewEdge}"
                Set-CsTenantFederationConfiguration -Tenant $tenid.guid -BlockedDomains @{Remove=$NewEdge}
                
                write-host " "
                Logit "New list of Blocked Domains"
                write-host " "
                (Get-CsTenantFederationConfiguration | Select-Object –ExpandProperty BlockedDomains).Domain
                  write-host " "       
                
            .\82User.ps1

        }
       

        "B" {
            .\75tenantMenu.ps1
        }

        
	  
        default{            
	    logit "Unexpected Value in Menu 82";
	    exit;
        }

    }<# end of Switch #>


