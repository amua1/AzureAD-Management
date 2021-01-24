##########################################################
#  Single user recover script - Azure AD                                        #
##########################################################

clear
Write-Host "Here is a list of deleted users that can be recovered"
Get-MsolUser -ReturnDeletedUsers | Select-Object UserPrincipalName,DisplayName
$username = Read-Host "Enter the username of the user that you need to recover"
Try
{
    Restore-MsolUser -UserPrincipalName $username -AutoReconcileProxyConflicts
    Write-Host "User was restored successfully"
    clear
}
Catch
{
    Write-Host "Unexpected error"
}