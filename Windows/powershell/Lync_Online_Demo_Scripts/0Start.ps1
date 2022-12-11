<#-------------------------------------------------------#>
<#******#>
<# TODO:                                                       #>
<#******#>
<# 1. Replace Username and Tenant                           #>
<# 2. Replace the Tenant name - displayed in 75 prior to login #>
<# 3. Set the Directory containing the scripts                 #>
<# 4. Set the Department Name to show group management         #>
<# 5. used as default when selecting a user to manage          #>
<#                                                             #>
<#1#> $Global:user = "YOUR_USER@YOUR_TENANT.onmicrosoft.com";
<#2#> $Global:tnt  = "YOUR TENANT";
<#3#> $Global:pth  = "c:\PATH_WHERE_YOU_PUT_THE_SCRIPTS" 
<#4#> $Global:UDep = "YOUR_DEPARTMENT"
<#5#> $Global:defUser ="DEFAULT_USER_TO_MANAGE"
<#
<#-----------------------------------------TODO End------#>

<#Global variable used to assist exits#>
$global:ex = 0;
<#-------------------------------------#>
<#Check that we are running as Administrator#>
<#-------------------------------------#>
$adminrunning = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-NOT $adminrunning) { `
    write-host " " ;
    Write-Warning "...this doesn't feel right";
    write-warning "Recommendation: Exit and run as Administrator" ;
    write-host " " ; 
    break;}

<#-------------------------------------#>
<#Get the Operator's name              #>
<#      Customize for your own region  #>
<#-------------------------------------#>
$AdminName=([System.Security.Principal.WindowsIdentity]::GetCurrent().Name);
$global:Adm=($AdminName.split("\"))[1];
$execpol = Get-ExecutionPolicy
<#-------------------------------------#>
<#Set the Env variable and CD to the   #>
<#Directory containing the scripts     #>
<#-------------------------------------#>
#when we have an error (like a session timeout) we pause processing and ask when we should break
$ErrorActionPreference = "Inquire" 

<#Set some global variables#>
$Global:PolList = "Bpos" + $TenantSize;
$Global:OnVideo = $PolList + "allModality"
$Global:OffVideo = $PolList + "AllModalityNoVideo"

cd $pth
$env:path = $env:path + ";" + $pth
logit "****** PowerShell Session Started ******"
logit "$($adm.ToUpper()) running as Administrator"
logit "Get-ExecutionPolicy ----> $execpol"
logit "Working directory set to ----> $pth"
logit "Loading Demo Menu ...."
.\1demo.ps1