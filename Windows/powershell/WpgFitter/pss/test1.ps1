
# https://stackoverflow.com/questions/59059428/using-getelementsbyname-to-fill-in-form-fields-with-ie-object-but-value-not-gett

$ie = new-object -com "InternetExplorer.Application"
$ie.navigate("https://www.google.com")
while($ie.Busy) { 
    Start-Sleep -Milliseconds 100 
}
$ie.visible=$true
$doc=$ie.Document
$inputTags = $doc.getElementsByTagName("input")
$SearchBox = ($inputTags |Where-Object {$_.name -eq 'q'})
$SearchBox.value = "Visual Studio"