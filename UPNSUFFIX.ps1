$OLdUpnSuffix = '@contoso.com'
$NewUPnSuffix = '@sendmegb.tk'



$AllUsers = Get-ADUser -Filter *

foreach($user in $AllUsers)
{

    $user| Set-ADUser -UserPrincipalName ($user.Samaccountname + $NewUPnSuffix)



}

