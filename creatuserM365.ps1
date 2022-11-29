if(!(Get-MsolAccountSku))
{


    Connect-MsolService

}


$OLdUpnSuffix = '@contoso.com'
$NewUPnSuffix = '@M365x84644147.onmicrosoft.com'



$AllUsers = Import-Csv -Path C:\test\Import.csv

foreach($user in $AllUsers)
{

    New-MsolUser -UserPrincipalName ($user.Name + $NewUPnSuffix) -DisplayName $user.Name -LicenseAssignment (Get-MsolAccountSku).accountskuid[2] -usageLocation 'nl' -Password $user.password



}

