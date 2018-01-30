## Created by: Nicholas Glantz
## Function: Deletes a user account
##           Cleans out the C:\Windows\Temp directory
##           Starts an automated Sysprep batch script
## Date: November 30th, 2017

##Deletes USERNAME account
##Enter the name of the user in place of USERNAME
Get-WmiObject -Class Win32_UserProfile | where {$_.LocalPath.split()[-1] -eq 'Administrator.USERNAME'} | foreach {$_.Delete()}
$Computername = $env:COMPUTERNAME
    $ADSIComp = [adsi]"WinNT://$Computername"
$ADSIComp.Delete('User','USERNAME')

##Cleans out the C:\Windows\Temp directory
rmdir "C:\Windows\Temp\*" -ErrorAction SilentlyContinue

##Starts automatedsysprep batch script
Start-Process C:\Windows\System32\Sysprep\automatedsysprep.bat

##automatedsysprep.bat
##cd /d C:\Windows\System32\Sysprep
##sysprep.exe /oobe /shutdown /quiet
