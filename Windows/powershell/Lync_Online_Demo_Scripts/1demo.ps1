if ($ex) {logit "exit from demo.ps1";
    exit;}
<# set the menu colors#>
$cmf="DarkRed"
$cmb="DarkGray"
$global:displayon =1

<#Do we already have a session?#>

<#--------------------------------------------------------#>
<# Select a tenant and then:                              #>
<#     Enter Credentials                                  #>
<#       Initiate a Session                               #>
<#       Import the commands                              #>
<#--------------------------------------------------------#>
    $choice = -1
  
    $global:titre=$tnt + "                                                             ";
    $title=$titre.substring(0,59);
    write-host -backgroundColor darkBlue -foregroundcolor Gray "$title";
    write-host -backgroundColor darkBlue -foregroundcolor Gray "  Demo MENU                         Select Tenant          "
         
	write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [1] Login to $tnt Office 365 tenant - Verbose "
    write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [2] Login to $tnt Office 365 tenant           "
	   
       
    write-host -backgroundColor $cmb -foregroundcolor $cmf     "   [X] Exit                                                "
    write-host -NoNewLine                                      "   >"

    while ($choice -NotIn "1","2","X") { 
            $choice=read-host
    }
    logit "Demo Menu Selection = $choice"
    if (($choice -eq "x") -OR ($choice -eq "X")){
        exit;
    }

    if ($choice -eq "2") {$displayon = 0;}
   
    <#switch#>
    switch ($choice)
    {       
        "1"{  
        <#--------------------------------------------------------#>
        <# LyncMarketing: O365 E3 - creates sessions for:         #>
        <#      Lync Online in Verbose mode using logit.ps1       #>
        <#--------------------------------------------------------#>

            

            <#Note: $user was set as a global variable in 0Start.ps1#>
            $securepass=Read-Host "Enter your Lync Online password" -AsSecureString;
            
            logit "###############################################################################"
            logit "Initiating Lync Online Session (Verbose)"
            logit "###############################################################################"
            $opass=$securepass;
            $credential = New-Object System.Management.Automation.PSCredential $user, $securepass;
            logit "`$session = New-CsOnlineSession -Credential `$credential";
            $global:session = New-CsOnlineSession -Credential $credential -Verbose;
            logit "`$modname = Import-PSSession `$session";
            $global:modname = Import-PSSession $session -AllowClobber -Verbose;
            logit "Lync Marketing Import Completed ...... ModuleName ---> $modname";
            logit ""

            #######################################################################
            #Load the Azure AD MSOL Connector - used for checking license status
            #######################################################################
            logit "###############################################################################"
            logit "Initiating Azure Active Directory Session";
            logit "###############################################################################"
            logit "`$ocred = New-Object System.Management.Automation.PSCredential `$user, `$opass;"
            $ocred = New-Object System.Management.Automation.PSCredential $user, $opass;
            logit "connect-msolservice -credential `$ocred"
            connect-msolservice -credential $ocred 
            logit ""

            #######################################################################
            #Load the Exchange Connector - used for reporting
            #######################################################################
            logit "###############################################################################"
            logit "Initiating Exchange Session";
            logit "###############################################################################"
            logit "`$xSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri"
            logit "              ..... https://outlook.office365.com/powershell-liveid/"
            logit "              ..... -Credential `$ocred -Authentication Basic -AllowRedirection"
            $xSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $ocred -Authentication Basic -AllowRedirection
            logit "Import-PSSession `$xSession"
            Import-PSSession $xSession
            logit ""

            
            .\75tenantMenu.ps1
        }      
        "2"{  
        <#--------------------------------------------------------#>
        <# LyncMarketing: O365 E3 - creates sessions for:         #>
        <#      Lync Online in Silent mode (no logit)             #>
        <#--------------------------------------------------------#>

            

            <#Note: $user was set as a global variable in 0Start.ps1#>
            $securepass=Read-Host "Enter your Lync Online password" -AsSecureString;
            
            $opass=$securepass;
            $credential = New-Object System.Management.Automation.PSCredential $user, $securepass;
            
            $global:session = New-CsOnlineSession -Credential $credential ;
            
            $global:modname = Import-PSSession $session -AllowClobber ;
            
            #######################################################################
            #Load the Azure AD MSOL Connector - used for checking license status
            #######################################################################
            $ocred = New-Object System.Management.Automation.PSCredential $user, $opass;
            connect-msolservice -credential $ocred 
            
            #######################################################################
            #Load the Exchange Connector - used for reporting
            #######################################################################
            $xSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $ocred -Authentication Basic -AllowRedirection
            Import-PSSession $xSession
            logit ""

                       
            .\75tenantMenu.ps1
        }      
      
        default{            
	    logit "Unexpected Value in Demo Menu";
	    exit;
        }

    }<# end of Switch #>


