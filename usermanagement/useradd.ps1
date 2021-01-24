##########################################################
#  Single user adding script - Azure AD                                        #
##########################################################

clear
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$displaynamesu = Read-Host "Enter the display name for the user"
$userprincipalnamesu= Read-Host "Enter the user principal name ex. user@contoso.com"
$mailnicknamesu = Read-Host "Enter the mail nickname ex. User01"
$PasswordProfile.Password = Read-Host "Enter a password for the user"
New-AzureADUser -AccountEnabled $True -DisplayName $displaynamesu -PasswordProfile $PasswordProfile -MailNickName $mailnicknamesu -UserPrincipalName $userprincipalnamesu

    