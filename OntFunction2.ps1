

#$array = @('equals','GetHashCode','Tostring','Gettype')
#$Csv = ((Import-Csv -Path C:\right\fault.csv) | Get-Member)  |Where-Object {$array -notcontains $_.Name}


if(!(Test-Path -Path 'C:\right'))
{

    New-Item -Path 'C:\right' -ItemType Directory

}


Write-Host "Did you place a file in the c:\right folder named fault.csv  (y/n) "
$Answer = Read-Host
while($Answer -ne 'y')
{

    Write-Host "Please place a file to be deduplicated in the C:\right folder named fault.csv and press 'y'"
    $Answer = Read-Host

}




if(Test-Path -Path C:\right\correct.csv)
{

    Remove-Item -Path C:\right\correct.csv

}

$Original = Import-Csv -Path C:\right\fault.csv

$Reference =  Import-Csv -Path C:\right\fault.csv

$TargetArray = New-Object System.Collections.ArrayList

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

      if($Done)
      {


        Write-Verbose -Message("User " +$item.firstname + " exists more times") -Verbose 


      }

      if(!($Done))
      {
        $FirstName = $item.firstname
        $LastName = $item.lastname
        $hash = [ordered]@{"FIRSTNAME" = $FirstName; "LASTNAME"= $LastName} 

        $Object = New-Object -TypeName psobject -Property $hash 

        $TargetArray.Add($Object) | Out-Null

        $Object | Export-Csv -Path 'c:\right\correct.csv' -Append -NoTypeInformation -Delimiter ',' 

       


       }
        

        

    
}