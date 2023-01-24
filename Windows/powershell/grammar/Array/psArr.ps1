# https://www.educba.com/powershell-array-of-strings/

# To create a string array, we can declare the variable name.
[String[]] $var = "PowerShell", "String", "Array", "askkdadadsa", "abc", "123"

$var


# Another way is to create using the @().
$strarry = @("PowerShell", "String", "Array")
$strarry


# One more way is by creating the system.collections.arraylist class method as shown below.
New-Object -TypeName System.Collections.ArrayList
$arrlist = [System.Collections.ArrayList]@("PowerShell3", "String3", "Array3")
$arrlist

$str = "This is a PowerShell String"
$str

# When we check its datatype, it is the string type.
$str.GetType()

# You can check typeName is a String and BaseType is a System. Object.
# When we add the multiple strings
$str1 = "This is a PowerShell String", "This is a second string"
$str1

# Datatype of this variable.
$str1.GetType()

# You can see the Type is converted to Object[] and the base type is converted to System.Array. Object[] array means it can accept multiple strings.
# String Array Indexing
# To check the length of the string we entered,
$str1.Length

# When you declare the string array, its length is 0.
[String[]] $strarry1
$strarry1.Length

$strarry2 = @()
$strarry2.Length

# Once we add the items, their length gets increased, and actually, it works on the indexing part. 
# Every time we add the items to the string array, its index increase by 1 and it starts from 0.
[String[]] $strArr = "First String", "Second String", "Third String"
Write-Output "0th Index: $($strArr[0])"
Write-Output "2nd Index: $($strArr[1])"

# Apparently, the Index which is not present will not get any output or 
#    will throw an exception like index 4 is not present so $Str[4] will not give any output.

# Here-String method – Not Useful
# The string can also be declared with the Hare-String method. 
# This method is a free text format and we can enter any number of the strings inside the Here-String method but let see if it only a string or the string array.
$hashstr = @'
First String
Second String
Third String
'@

#The above $hashstr gives the three strings as an output.
$hashstr

# When we check its length,
$hashstr.Length

# It doesn’t give the length 3 but it counts the word means that here-string can’t be considered as a string array but as a string. See the proof below.
$hashstr.Count

# The total count is 1 means it is considered a single string.
# Methods supported by String array

# When we need to perform the various operations on the string array, we always need to check which methods are supported for the operation.
# Once we have created a string array we can use the below commands to find the methods.

$str | Get-Member -MemberType Method

# Get-Content method

# When You retrieve any file content using the Get-Content command, it is automatically converted to the system array.
# For example, we have a text file name Test.txt stored at the C:\temp location.
# We will check its datatype,
$file = Get-Content C:\Temp\test.txt
$file.GetType()

# Let us discuss examples of PowerShell Array of Strings.
# Example #1: Adding value to the array string.
# We can add values to the string array using
$str123 = @("PowerShell", "Azure", "AZ Module")
$str123

# We have the above string array and to add the value to the string array,
$str123 += "DevOps"
$str123 += "PowerCLI"
$str123

# Example #2: Changing case of the string array using PowerShell.
# You can change the string array to the Upper case or the lower case and for that, you need to use ToUpper() or ToLower()
$strAbc = @("PowerShell1", "Azure2", "AZ Module3")
$strAbc.toUpper()
$strAbc.toLower()

# Example #3: Using the String ArrayList method to add values to an array.
# When we declare a simple string array, 
# we can’t add or remove the values from the array using Add() or Remove() because it was created with a fixed size. See the example below.
$strTmp = @("PowerShell", "Azure", "AZ Module")
$strTmp.Add("PowerCLI")

# To check if the string array is fixed size or not,
$strTmp.IsFixedSize

# To solve the above problem, instead of creating a fixed-size array, we can use ArrayList of the string.
New-Object -TypeName System.Collections.ArrayList
$arrlist = [System.Collections.Arraylist]@("PowerShell", "Azure")
$arrlist.Add("PowerCLI")
$arrlist.Add("DevOps")

# To remove the value from the arraylist,
$arrlist.Remove("Azure")
$arrlist

# Example #4: To check if the string array contains a specific string.
# We need to use the Contains() method to check if the string array contains any specific string.
$str = @("PowerShell", "Azure", "AZ Module", "DevOps", "AzCLI")
$str.Contains("Azure")
$str.Contains("Dev")

# Wildcard character won’t support this method.
$str.Contains("*Module*")


# Example #5: Use the Select-String command to search from the string array.
# When we deal with the files in the string array format and if we need to retrieve the particular line from that file or the matching lines, 
#     we can use the Select-String method as shown below.
$file = Get-Content C:\Temp\test.txt
$file
$file | Select-String -Pattern "new"
$file | Select-String -Pattern "line"

#Conclusion
#PowerShell string array is useful daily in the automation engineer life and we need to use it in the script to manipulate the items, 
#      retrieve the specific data from the string, replacing the data, and storing the command output in the text format.

#Recommended Articles
#This is a guide to PowerShell Array of Strings. Here we discuss definition, syntax, and parameters, 
# How does the array of string works in PowerShell? examples with code implementation. You may also have a look at the following articles to learn more










