# PowershellSysprep

## Created by: Nicholas Glantz
Function: Deletes a user account, If the directory C:\ProgramData\Alloy Software exist it deletes it, Cleans out the C:\Windows\Temp directory, Starts automatedsysprep.bat
Date: November 30th, 2017
--------------------------------------------

I created this script to reduce error before capturing an image. Deleting the user will make sure when sysprep is ran with OOBE the user won't have an account when rebooting. When running this script & sysprep, I am logged into local administrator account, because the local administrator account is disabled after running sysprep OOBE. 

Deleting the path if exist is ran on an IF statement because not always the directory is created when creating a base image.

Cleaning out the Temp directory of additional unwanted files and folders

Once thats done it will start sysprep.exe
