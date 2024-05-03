$PASSWORD_FOR_USERS = "Password1"
# ---- the above is the password assigned to all users----#

$USER_FIRST_LAST_LIST = Get-Content .\names.txt
#---- the above will pull names from our text file names.txt and place them into an array----#

$password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force
New-ADOrganizationalUnit -Name _USERS -ProtectedFromAccidentalDeletion $false
#---- above first line converts plain text passwords and converts it to an object Powershell can use as a secure password----#
#---- above second line creates new organizational unit called USERS and allows for deletion -----#

foreach ($n in $USER_FIRST_LAST_LIST) {
    $first = $n.Split(" ")[0].ToLower()
    $last = $n.Split(" ")[1].ToLower()
    $username = "$($first.Substring(0,1))$($last)".ToLower()
    Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Green
    
    New-AdUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=_USERS,$(([ADSI]`"").distinguishedName)" `
               -Enabled $true
}

#---- a loop where $n is the variable for every user in the text file.----#
#---- line 13 splits element 0 with a space, takes element 0 and store into variable $first, sets to lower case ----#
#---- line 14 splits element 1 with a space, takes element 1 and stores into variable $last, sets to lower case ----#
#---- line 15 takes first character from variable $first and variable $last, sets to lower case ----#
#---- line 16 creates output to the screen with username in green with black background ----#