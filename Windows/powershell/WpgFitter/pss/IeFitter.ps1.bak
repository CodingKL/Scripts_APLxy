
# https://qiita.com/ponsuke0531/items/4629626a3e84bcd9398f
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
# Windows PowerShell ISE run as administrator
 
# Set URL
$Url = "https://www.plexonline.com"; 
#$url = "https://www.baidu.com"; 
#$URL = "https://qiita.com/"; 
#$URL = "https://qiita.com/login/"; 

#$Username = "xxxx";
#$Password = "xxxx";
#$CompanyCode = "xxx";
$Username = "TestSelenium";
$Password = "Mki123@zyh";

# 为IE创建一个新的COM对象。
#$IE = New-Object -ComObject internetexplorer.application;
#$IE = New-Object -ComObject InternetExplorer.application;
$IE = New-Object -ComObject InternetExplorer.Application;

# 将IE设置为全屏。
$IE.FullScreen = $true;
# 将IE设置为可见。
$IE.Visible = $true;

# 将IE导航到指定的URL。
#$IE.navigate($url); 
$IE.Navigate($url); 
#$ie.Navigate("C:\users\310080829\Desktop\test.html")
#$ie.Navigate("D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\html\test.html")
#$ie.Navigate("D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\html\runoob-tryhtml_link_target.html")
#$ie.Navigate("D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\html\runoob-tryhtml_link_locations.html")


#$IE.Navigate2("https://stackoverflow.com");

# 等到IE不再繁忙。
while ($IE.Busy -eq $true) 
{
    Start-Sleep -Milliseconds 5000; 
} 
Start-Sleep -Milliseconds 5000; 
# 将指定的用户名、密码和公司代码插入到各自的字段中。
$IE.Document.getElementById("txtUserID").value = $Username;
$IE.Document.getElementByID("txtPassword").value = $Password;
#$IE.Document.getElementByID("txtCompanyCode").value = $CompanyCode;

#$IE.Document.getElementById("identity").value = $Username;

#$link = $ie.Document.getElementsByTagName('A') | where-object {$_.innerText -eq 'ログイン'}
#$link = $IE.Document.getElementsByTagName('a')  |  Where-Object {$_.href -eq 'login'} 

#$link = $IE.Document.getElementsByTagName('a') 

#$link = $IE.Document.getElementsByTagName('a')
#$temp = $IE.document.getElementsByTagName('h1');

#$link = $IE.Document.getElementsByTagName('a') | Where-Object {$_.href -eq '#C4'} 
#$link.click() 

#$link = $doc.getElementsByTagName('a') | Where-Object {$_.href -match '`#r1r3'} 
#$link = $IE.getElementsByTagName('h1') | Where-Object {$_.href -match '`#C4'} 
#$link.click() 

# 开始登录过程。
#$IE.Document.getElementById("btnLogin_Label").Click();

#$titles = $ie.Document.body.getElementsByClassName('newstitle')
$titles = $ie.Document.body.getElementsByTagName('p')
foreach ($storyTitle in $titles) {
     Write-Output $storyTitle.innerText
}

