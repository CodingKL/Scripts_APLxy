
$WebsiteCfgArr = @{}

#Read config information from file
#Import-Csv ..\cfg\WebsiteInfo.cfg -header Key,Val -Delimiter "=" | % { $WebsiteCfgArr.Add($_.Key.Trim(), $_.Val.Trim())}
#Import-Csv D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\cfg\WebsiteInfo.cfg -header Key,Val -Delimiter "=" | % { $WebsiteCfgArr.Add($_.Key.Trim(), $_.Val.Trim())}

# run from bat 
Import-Csv .\cfg\WebsiteInfo.cfg -header Key,Val -Delimiter "=" | % { $WebsiteCfgArr.Add($_.Key.Trim(), $_.Val.Trim())}

# https://www.tutorialspoint.com/powershell/powershell_array.htm
write-host("Print all the config information:")
$WebsiteCfgArr
Write-Host "`n"

$myList = 5.6, 4.5, 3.3, 13.2, 4.0, 34.33, 34.0, 45.45, 99.993, 11123
write-host("Print all the array elements")
$myList

write-host("Get the length of array")
$myList.Length

write-host("Get Second element of array")
$myList[1]

write-host("Get partial array")
$subList = $myList[1..3]

write-host("print subList")
$subList

write-host("using for loop")
for ($i = 0; $i -le ($myList.length - 1); $i += 1) {
  $myList[$i]
}

write-host("using forEach Loop")
foreach ($element in $myList) {
  $element
}

write-host("using while Loop")
$i = 0
while($i -lt 4) {
  $myList[$i];
  $i++
}

write-host("Assign values")
$myList[1] = 10
$myList

# 从 PowerShell 脚本启动 Internet Explorer
# https://www.it1352.com/2340797.html

$logFileName = "log_" + (Get-Date).ToString('yyyyMMdd-HHmmss') + ".log"
Start-Transcript ..\log\$logFileName

$startIeCmd = New-Object -ComObject InternetExplorer.Application
$startIeCmd.Visible = $true
#$startIeCmd.Navigate2("https://stackoverflow.com");

# https://blog.csdn.net/purvispanwu/article/details/115423213?spm=1001.2101.3001.6650.7&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-7-115423213-blog-127362343.pc_relevant_3mothn_strategy_and_data_recovery&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7ERate-7-115423213-blog-127362343.pc_relevant_3mothn_strategy_and_data_recovery&utm_relevant_index=14

# https://www.zhblog.net/qa/to-use-chrome.html

$Url = "https://www.plexonline.com"; 
#$Username="xxxx";
#$Password="xxxx";

$Credential = New-Object System.Management.Automation.PSCredential -ArgumentList @($Username,(ConvertTo-SecureString -String $Password -AsPlainText -Force))


# Start-Process "<path to chrome.exe>" $Url -Credential $Credential -WindowStyle Maximized
#Start-Process "C:\Program Files\Google\Chrome\Application\chrome.exe" $Url -Credential $Credential -WindowStyle Maximized
#Start-Process "C:\Program Files\Google\Chrome\Application\chrome.exe" $Url

# post processing
