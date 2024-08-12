# GPO-AutopilotHashGenerator

Powershell Script that generates Windows Autopilot Hashes (HWID) to a CSV on a File Share location

# Why?

The existing Windows 10 clients were not Microsoft EntraID joined, and needed to be upgraded (clean-installed) to Windows 11

I wanted to be fully in control of the Hash-generation/upload and didn’t want to make the step of joining the existing devices to Entra, to convert them to Autopilot (and thereby use the built-in GPO).

With this script we can export the hashes, per client to a file location and upload them manually one-by-one (if wanted).

After letting the script run for a couple of weeks I [combined](https://www.reddit.com/r/Intune/comments/unh98z/combine_multiple_autopilot_hash_csvs_into_one/) the hashes in one single CSV file (after filtering, only wanted some devices) and uploaded it in the Autopilot Devices interface.

# How to Use

1.  Download the Repository
2.  Create a (hidden) File-share, set ‘Everyone’ to Read (e.g. \\\\SERVERNAME\\Autopilot\$)
3.  Copy the files of the repo to the created file-share
4.  Open HWID.cmd in a text-editor (VS Code, Notepad++ etc.)
5.  Edit line 2: Change file-share location to the created File share – PS1 Script location (e.g. \\\\SERVERNAME\\Autopilot\$\\Get-WindowsAutoPilotInfo.ps1)
6.  Edit line 4: Change file-share location to the created File share – HWID Location (e.g. \\\\SERVERNAME\\Autopilot\$\\Hashes)
7.  Open the Group Policy Editor
8.  Create a new policy, scope to Domain Computers
9.  Go to ‘Windows Settings -\> Scripts (Startup/Shutdown)-\> Startup

    Add the HWID.cmd script to Startup Scripts

10. Scope to Domain Computers
11. Done!
