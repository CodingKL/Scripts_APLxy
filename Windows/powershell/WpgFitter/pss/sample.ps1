
# https://qiita.com/akrmsd/items/35eb59687885a9d4beb8

# Internet Explorer���N������B
$ie = New-Object -ComObject InternetExplorer.Application

# Internet Explorer��\������B
$ie.Visible = $true

# Web��ʂֈړ�����B
#$ie.Navigate('.\sample1.html')
#$ie.Navigate('D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\html\sample1.html')
#$ie.Navigate('D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\html\sample3.html')
#$ie.Navigate("D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\html\runoob-tryhtml_link_target.html")
$ie.Navigate('D:\github\Scripts_APLxy\Windows\powershell\WpgFitter\html\testxxx.html')

# �y�[�W�����S�ɐ؂�ւ��̂�҂B
while($ie.Busy) { Start-Sleep -milliseconds 1000 }

# IE��ʑ�����s�����߂̃h�L�������g�I�u�W�F�N�g�擾
$doc = $ie.document

$ID  = $doc.getElementById('Keywords')

# ID����
#$idElements = $doc.getElementsByName("auth_id")
# idElements�͕����擾�����̂ŁA1�����v�f���Ȃ��Ƃ��z��Ƃ��ăA�N�Z�X����K�v������
#@($idElements)[0].value = "�����ł�"

# �p�X���[�h����
#$passwdElements = $doc.getElementsByName("auth_password")
#@($passwdElements)[0].value = "�p�X���[�h"

# �{�^���N���b�N�iID��Name���Ȃ��̂ŁAvalue�Ŕ���j
#$inputElements = $doc.getElementsByTagName("input")
#Foreach($inputElement in $inputElements) {
 #   if ($inputElement.value -eq "�F��") {
  #      $inputElement.click()
   # }
#}