
# https://blog.csdn.net/Haven200/article/details/12517493

$ie = new-object -com "InternetExplorer.Application"
$ie.Navigate("www.115.com");  #打开115网页
$ie.Visible = $true                    #使IE窗口可见

[System.Threading.Thread]::Sleep(4000) #等待加载页面，也可以用$ie.busy写个Function来判断页面是否加载完成

#Prompt The Selected Yes Or No
$title  = "IE模式"
$message = "请修改IE模式为兼容或IE8"
$yes  = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "已经修改IE模式"
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "没有修改IE模式"
$options  = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
$result  = $host.ui.PromptForChoice($title, $message, $options,1)
switch ($result)
{
    0  { write-host  "`n登录115.com`n"  -foregroundcolor Yellow;}
    1  { write-host  "`n退出脚本`n"  -foregroundcolor Magenta; exit}
}

# while($ie.ReadyState -ne 4) {start-sleep -m 100}

$doc  =  $ie.document
$userid  = $doc.getElementById("js-account")  #获取用户名输入框，其ID为js-account
$userpwd  = $doc.getElementById("js-passwd")  #获取密码输入框，其ID为js-passwd
$userid.value = "...." #输入用户名

