##########################################################
#                                       User Invite Script                                     #
##########################################################

Write-Host "This script lets you invite users using PowerShell"

$inviteduserdisplayname = Read-Host "Enter the guest user display name"
$inviteduseremailaddress= Read-Host "Enter the guest user e-mail address"

New-AzureADMSInvitation -InvitedUserDisplayName $inviteduserdisplayname -InvitedUserEmailAddress $inviteduseremailaddress -InviteRedirectURL https://myapps.microsoft.com -SendInvitationMessage $true
