$Original = Import-Csv -Path C:\right\fault.csv

$Reference =  Import-Csv -Path C:\right\fault.csv

$TargetArray = @()

if(Test-Path -Path C:\right\correct.csv)
{

    Remove-Item -Path C:\right\correct.csv

}
foreach($item in $Original)
{
      $Done = $false
    
       
      foreach($line in $TargetArray)
      {
        
            
            if($item.FIRSTNAME -eq $line.Firstname -and $item.LASTNAME -eq $line.LASTNAME)
            {

                
                $Done = $true
               
            }


      }

      if(!($Done))
      {

        $hash = @{ "FIRSTNAME" = $item.FIRSTNAME; "LASTNAME"= $item.LASTNAME; "DESCRIPTION" = $item.DESCRIPTION}

        $Object = New-Object -TypeName psobject -Property $hash

        $TargetArray += $Object

        $Object | Export-Csv -Path 'c:\right\correct.csv' -Append -NoTypeInformation -Delimiter ','

        Write-Verbose -Message("User " +$item.firstname + " exists 1 times") -Verbose 


       }
        

        

    
}