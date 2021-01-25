##########################################################
#  Create group                     - Azure AD                                        #
##########################################################

clear
$grouptype = Read-Host "What type of group do you want to create:
    1. Basic Group
    2. Dynamic Group (Dynamic User)
"

if ($grouptype -eq 1)
{
    $groupname = Read-Host "Enter the group name"
    $nickname = Read-Host "Enter the mail nickname"
    New-AzureADGroup -DisplayName $grouptype -MailEnabled $false -SecurityEnabled $true -MailNickName $nickname
}
elseif ($grouptype -eq 2)
{
   Write-Host "Dynamic group creation will be added later"
}
else
{
    Write-Host "Enter a number from the specified options above"
}

