## Created by: Nicholas Glantz
## Function: Deletes a user account
##           If the directory C:\ProgramData\Alloy Software exist it deletes it.
##           Cleans out the C:\Windows\Temp directory
##           Starts sysprep.exe
## Date: November 30th, 2017

##Deletes USERNAME account
$Computername = $env:COMPUTERNAME
    $ADSIComp = [adsi]"WinNT://$Computername"
$ADSIComp.Delete('User','USERNAME')

##If the directory C:\ProgramData\Alloy Software exist it deletes it.
$AlloySoftware = "C:\ProgramData\Alloy Software"
if ( Test-Path -Path  $AlloySoftware){
       rmdir $AlloySoftware
}

##Cleans out the C:\Windows\Temp directory
rmdir "C:\Windows\Temp\*" -ErrorAction SilentlyContinue

##Starts sysprep.exe
Start-Process C:\Windows\System32\Sysprep\sysprep.exe