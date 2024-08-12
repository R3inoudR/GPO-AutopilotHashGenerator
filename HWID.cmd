# Local File Location for HWIDs
MD C:\HWID
Copy \\SCRIPT_LOCATION\Autopilot$\Get-WindowsAutoPilotInfo.ps1 C:\HWID\
PowerShell -executionPolicy bypass -file "C:\HWID\Get-WindowsAutoPilotInfo.ps1" -OutputFile C:\HWID\%computername%.csv -Append
Copy C:\HWID\*.csv \\SCRIPT_LOCATION\Autopilot$\Hashes\