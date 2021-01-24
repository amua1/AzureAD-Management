##########################################################
#  Single user deletion script - Azure AD                                      #
##########################################################

$searchstring = Read-Host "Search for a user or Press Enter to display all users"
Get-AzureADUser -SearchString $searchstring | Format-Table
$objectid = Read-Host "Enter the username of the user you want to delete (ex. user@contoso.com)"

Remove-AzureADUser -ObjectId $objectid
