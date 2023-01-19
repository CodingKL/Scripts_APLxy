
# https://qiita.com/akrmsd/items/35eb59687885a9d4beb8

# Internet Explorerを起動する。
$ie = New-Object -ComObject InternetExplorer.Application

# Internet Explorerを表示する。
$ie.Visible = $true

# Web画面へ移動する。
#$ie.Navigate('.\sample1.html')
#$ie.Navigate('D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\html\sample1.html')
#$ie.Navigate('D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\html\sample3.html')
#$ie.Navigate("D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\html\runoob-tryhtml_link_target.html")
$ie.Navigate('D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\html\testxxx.html')

# ページが完全に切り替わるのを待つ。
while($ie.Busy) { Start-Sleep -milliseconds 1000 }

# IE画面操作を行うためのドキュメントオブジェクト取得
$doc = $ie.document

$ID  = $doc.getElementById('Keywords')

# ID入力
#$idElements = $doc.getElementsByName("auth_id")
# idElementsは複数取得されるので、1つしか要素がなくとも配列としてアクセスする必要がある
#@($idElements)[0].value = "あいでぃ"

# パスワード入力
#$passwdElements = $doc.getElementsByName("auth_password")
#@($passwdElements)[0].value = "パスワード"

# ボタンクリック（IDもNameもないので、valueで判定）
#$inputElements = $doc.getElementsByTagName("input")
#Foreach($inputElement in $inputElements) {
 #   if ($inputElement.value -eq "認証") {
  #      $inputElement.click()
   # }
#}