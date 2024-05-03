$First_Name = Read-Host -Prompt "Enter First_Name: "
$Last_Name = Read-Host -Prompt "Enter Last_Name: "
$Username = Read-Host -Prompt "Enter Username: " 
$Password = Read-Host -Prompt "Enter Password: "

New-ADuser `
-AccountPassword(ConvertTo-SecureString $Password -AsPlainText -Force) `
-GivenName $First_Name `
-Surname $Last_Name `
-name $Username `
-UserPrincipalName $Username `
-DisplayName $Username `
-path "OU=HR,DC=mydomain,DC=com"

$params = @{
    Filter = 'Name -like "*"'
    SearchBase = 'OU=HR,DC=MYDOMAIN,DC=COM'
}
Get-ADUser @params | Enable-ADAccount
