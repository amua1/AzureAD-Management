##########################################################
#  Script for basic user management in Azure AD                       #
##########################################################
clear
Write-Host "This script helps you do basic user and group management in Azure AD"

# This line checks whether the user is connected to Azure or not
$checkifuserisconnected = Read-Host "Have you connected recently to Azure AD ,
1. YES
2. NO
"

If ($checkifuserisconnected -eq 2)
{
    Connect-AzureAD
}


while ($True)
{
# This is the beginning of the script

Write-Host "Type 1 , 2 or 3 based on the choices below:"
$categorysel = Read-Host "
1. User Management
2. Group Management
3. Multifactor-Authentication Setup
"
clear

if ($categorysel -eq 1)
{
    Write-Host "You have choosen the USER MANAGEMENT section - Here you can Add , Delete , Modify and Recover deleted users"
    Write-Host "Choose one of the options provided below"
    $usermanagementsel = Read-Host "
        1. Add Users
        2. Invite Users
        3. Delete Users
        4. Update Users
        5. Recover Deleted Users
"
    if ($usermanagementsel -eq 1)
    {
         .\usermanagement\useradd.ps1
    }
    elseif ($usermanagementsel -eq 2)
    {
        .\usermanagement\userinvite.ps1
    }
    elseif ($usermanagementsel -eq 3)
    {
        .\usermanagement\userdelete.ps1
    }
    elseif ($usermanagementsel -eq 4)
    {
        .\usermanagement\usermodify.ps1
    }
}
#other settings to be added later



}


