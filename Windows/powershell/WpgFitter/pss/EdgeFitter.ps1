
$Url = "https://www.plexonline.com"; 
$Username = "TestSelenium";
$Password = "Mki123@zyh";

#start microsoft-edge:https://netflix.com/browse

start microsoft-edge:$Url

$wshell = New-Object -ComObject wscript.shell;

$wshell.AppActivate('edge') 

while ($IE.Busy -eq $true) 
{
    Start-Sleep -Milliseconds 5000; 
} 

$wshell.Document.getElementById("txtUserID").value = $Username;
$wshell.Document.getElementByID("txtPassword").value = $Password;

while ($true)
{
    Sleep 2
    $wshell.SendKeys('{f11}')
    exit 
}

exit