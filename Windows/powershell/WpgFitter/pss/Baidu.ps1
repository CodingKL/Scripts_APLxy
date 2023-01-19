
# https://zhuanlan.zhihu.com/p/351686861

#声明变量
#待会要用的链接
$Url = "http://baidu.com"

#待会要用的关键词
$Keyword = "微软药丸"

#创建一个IE对象
$IE = New-Object -com internetexplorer.application
$IE.visible = $true

#导航到URL
$IE.navigate($url);

#等待完全加载
while ($IE.Busy -eq $true) {
    Start-Sleep -s 1
    Write-Host "wait for loading..." -ForegroundColor Gray
}

#在 Console 打印 Log
Write-Host "Enter Baidu Main Page" -ForegroundColor Cyan

#找到百度首页的输入框元素，输入关键词。#通过浏览器的F12开发者工具找到输入框元素的ID为kw
#$IE.Document.getElementById("kw").value = $Keyword
$IE.Document.IHTMLDocument3_getElementById("kw").value = $Keyword

#找到百度首页的搜索按钮，执行点击事件#通过浏览器的F12开发者工具找到搜索按钮元素的ID为su   
$IE.Document.getElementById("su").Click()

Write-Host "Submit keyword" -ForegroundColor Cyan
start-sleep -milliseconds 500

#等待页面加载
while ($IE.Busy -eq $true) {
    Write-Host "wait for loading..." -ForegroundColor Gray
    Start-Sleep -s 1
}


#没有意义的等待延时，就是任性一下
Start-Sleep -s 1

Write-Host "Bye!" -ForegroundColor Cyan