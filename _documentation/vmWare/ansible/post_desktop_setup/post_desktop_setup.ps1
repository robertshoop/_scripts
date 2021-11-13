# Install RSAT (via Online resources)
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

# Install PowerShell 7 - Latest Release via winget
winget install --id Microsoft.Powershell --source winget

# Install Windows Terminal
winget install Microsoft.WindowsTerminal

# Add a git to pull settings at a later time and place in dir below:
# %LocalAppData%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState

