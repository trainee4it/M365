if(!(Get-MsolAccountSku))
{


    Connect-MsolService

}


$OLdUpnSuffix = '@contoso.com'
$NewUPnSuffix = '@M365x84644147.onmicrosoft.com'



$AllUsers = Import-Csv -Path C:\test\Import.csv

foreach($user in $AllUsers)
{
    
    if($user.Name -ne 'cloud11' -and $user.Name -ne 'cloud12')
    {

        New-MsolUser -UserPrincipalName ($user.Name + $NewUPnSuffix) -DisplayName $user.Name  -usageLocation 'nl' -Password $user.password -LicenseAssignment (Get-MsolAccountSku).accountskuid[2]

    }

}

