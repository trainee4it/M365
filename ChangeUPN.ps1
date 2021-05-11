$users = Get-ADUser -Filter *

$OldUPN ='contoso.com'
$NewUpn = 'adatum.com'

foreach($item in $users)
{
    

    Get-ADUser -Identity $item.SamAccountName | Set-ADUser -UserPrincipalName $item.UserPrincipalName.Replace($OldUPN,$NewUpn)
  
    


}

