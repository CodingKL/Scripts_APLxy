
::echo Get-ExecutionPolicy
::Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process

::powershell ./pss/test1.ps1
::powershell .\pss\testBcp.ps1
::powershell .\pss\WpgFitter.ps1
::powershell D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\pss\WpgFitter.ps1

goto comment
起動引数の指定方法
PowerShell.exe -ExecutionPolicy Unrestricted
https://www.curict.com/item/d1/d1c4a3e.html

PowerShellでこのシステムではスクリプトの実行が無効になっているため、ファイル hoge.ps1 を読み込むことができません。となったときの対応方法
https://qiita.com/ponsuke0531/items/4629626a3e84bcd9398f

:comment


::powershell -ExecutionPolicy Unrestricted C:\Users\user\zyh\Scripts_APLxy\Windows\powershell\WpgFitter\pss\WpgFitter.ps1

powershell -ExecutionPolicy Unrestricted .\pss\WpgFitter.ps1

pause
exit
