
# https://stackoverflow.com/questions/34986769/unspecified-error-when-calling-getelementbyid

# Edit this to be the URL or IP address of the site to launch on login
$Url = "www.gmail.com"

# Edit this to be the username
$Username= "xxxx@gmail.com"

# Edit this to the corresponding password
$Password= "xxxxx"

# Edit this to be the path to the executable.  Include the executable 
# file name as well.
$Executable = "c:\windows\system32\notepad.exe"

# Invoke Internet Explorer
$IE = New-Object -com internetexplorer.application;
$IE.Visible = $true;
$IE.Navigate($url);

# Wait a few seconds and then launch the executable.
while ($IE.Busy -eq $true) {
  Start-Sleep -Milliseconds 5000;
}

# The following UsernameElement, PasswordElement, and LoginElement need
# to be modified first.  See the notes at the top of the script for more
# details.
$IE.Document.getElementById("Email").value = $Username
$IE.Document.getElementById("signIn").Click()
$IE.Document.getElementByID("Passwd").value=$Password
$IE.Document.getElementById("signIn").Click()

while ($IE.Busy -eq $true) {
  Start-Sleep -Milliseconds 5000;
}

Invoke-Item $Executable