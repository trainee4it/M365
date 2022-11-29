if(!(Get-MsolAccountSku))
{


    Connect-MsolService

}


$OLdUpnSuffix = '@contoso.com'
$NewUPnSuffix = '@M365x84644147.onmicrosoft.com'

$array = @('cloud11','cloud12')

$AllUsers = Import-Csv -Path C:\test\Import.csv

foreach($user in $AllUsers)
{
    
    if(!($array -contains $user.Name))
    {

        New-MsolUser -UserPrincipalName ($user.Name + $NewUPnSuffix) -DisplayName $user.Name  -usageLocation 'nl' -Password $user.password -LicenseAssignment (Get-MsolAccountSku).accountskuid[2]

    }

}

