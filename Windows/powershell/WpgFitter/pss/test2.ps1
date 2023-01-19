
#$IURL = "https://www.google.com"
$IURL = "https://meta.stackexchange.com/users/login?ssrc=head&returnurl=https%3a%2f%2fmeta.stackexchange.com%2f"
$ie = New-Object -com "InternetExplorer.Application"
$ie.visible = $true
$ie.silent = $true
$ie.Navigate($IURL)
while ($ie.Busy)
{
  [System.Threading.Thread]::Sleep(10)
}

if ( $ie -eq $null )
{
    'The array is $null'
    Write-Host "The array is $null" -ForegroundColor Cyan
}

$ie.Document.IHTMLDocument3_getElementsByTagName("Input")
#$ie.Navigate($IURL)
while ($ie.Busy)
{
  [System.Threading.Thread]::Sleep(10)
}
$ie.Document.IHTMLDocument3_getElementsByTagName("Input")
