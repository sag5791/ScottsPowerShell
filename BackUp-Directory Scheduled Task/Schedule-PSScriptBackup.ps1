# Create Scheduled Task Action
$Action = New-ScheduledTaskAction -Execute 'C:\Windows\System32\RoboCopy.exe' -Argument '"C:\Users\215404\OneDrive - MModal\PowerShell" "\\tsclient\F\PowerShell\MModal" /MIR /FFT /Z /XA:H /W:5 /log:c:\temp\MModal_Powershell_Backup.log /v'
# Create Scheduled Task Trigger
$Trigger = New-ScheduledTaskTrigger -Daily -At '3AM'
# Create Scheduled Task in Memory using the action and trigger
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings (New-ScheduledTaskSettingsSet)
# Create the Scheduled Task on system called "Transfer Powershell Scripts
$Task | Register-ScheduledTask -TaskName 'Transfer Powershell Scripts' -User "System"