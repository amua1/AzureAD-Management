##########################################################
#  Script for basic user management in Azure AD                       #
##########################################################
clear
Write-Host "This script helps you do basic user and group management in Azure AD"

#b001 ---This block checks whether the required modules are installed---#
Write-Host "Checking whether the required modules (AzureAD and MSOnline) are installed"

If (-not(Get-InstalledModule -Name AzureAD -ErrorAction silentlycontinue)) {
  Write-Host "Azure AD module is not installed - Installing ..."
  Install-Module -Name AzureAD 
  Import-Module -Name AzureAD
  clear
}
Else {
  Write-Host "Azure AD module is already installed"
}

If (-not(Get-InstalledModule -Name MSOnline -ErrorAction silentlycontinue)) {
  Write-Host "MSOnline module is not installed - Installing ..."
  Install-Module -Name MSOnline
  Import-Module -Name MSOnline
  clear
}
Else {
  Write-Host "MSOnline module is already installed"
}

#end of b001

#b002 --- This block checks whether the user is connected to Azure or not ---#

try 
{
    Get-AzureADTenantDetail
}
catch  [Microsoft.Open.Azure.AD.CommonLibrary.AadNeedAuthenticationException]
{
    Connect-AzureAD
}
clear
#end of b002

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

#main01
if ($categorysel -eq 1)
{
    Write-Host "You have choosen the USER MANAGEMENT section - Here you can Add , Delete , Modify and Recover deleted users"
    Write-Host "Choose one of the options provided below:"
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
    elseif ($usermanagementsel -eq 5)
    {
        .\usermanagement\userrestore.ps1
    }
    else 
    {
        Write-Host "Enter a number from the specified options above"
    }
}
#main01 end

#main02 start
if ($categorysel -eq 2)
{
    Write-Host "You have choosen the GROUP MANAGEMENT section - Here you can Create, Manage and Delete a group"
    Write-Host "Choose one of the options provided below:"
    $groupmanagementsel = Read-Host "
        1. Create a group
        2. Delete a group
        3. Manage a group
"

    if($groupmanagementsel -eq 1)
    {
        .\groupmanagement\groupadd.ps1
    }
    elseif ($groupmanagementsel -eq 2)
    {
        .\groupmanagement\groupdelete.ps1
    }
    elseif ($groupmanagementsel -eq 3)
    {
        .\groupmanagement\groupmodify.ps1
    }
    else
    {
        Write-Host "Enter a number from the specified options above"
    }
}
#main02 end


}


