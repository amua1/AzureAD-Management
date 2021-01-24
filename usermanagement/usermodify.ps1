##########################################################
#  Single user modify script - Azure AD                                        #
##########################################################

clear
$username = Read-Host "Enter username (ex. user@contoso.com)"
$usrid = Get-AzureADUser | where userprincipalname -eq $username

clear
$categorysel = Read-Host " What do you want to change:
1. Display Name
2. Enable Account
3. Disable Account
4. Usage Location
"
clear
while ($true)
{
    if($categorysel -eq 1)
    {
       $displayname = Read-Host "Enter the new display name"
        Set-AzureADUser -ObjectId $usrid.ObjectId -DisplayName $displayname
        break
    }
    elseif($categorysel -eq 2)
    {
        Set-AzureADUser -ObjectId $usrid.ObjectId -AccountEnabled $true
        break
    }
    elseif($categorysel -eq 3)
    {
        Set-AzureADUser -ObjectId $usrid.ObjectId -AccountEnabled $false
        break
    }
    elseif($categorysel -eq 4)
    {
        $usagelocation = Read-Host "Enter a new usage location"
        Set-AzureADUser -ObjectId $usrid.ObjectId -UsageLocation $usagelocation
        break
    }
    else
    {
        break
    }

}


