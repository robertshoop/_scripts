﻿# Bypasses the systems Execution Policy for the install and installs Chocolatey.
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# Cmdlet to install vs2019 plus desired packages defined.
# Change the --add flag for the additional packages you wish to install with Visual Studio and let the installer know a reboot WILL NOT take place after installation.
choco install visualstudio2019community --package-parameters "--add Microsoft.VisualStudio.Component.CoreEditor --add Microsoft.VisualStudio.Workload.CoreEditor --add Microsoft.NetCore.Component.Runtime.5.0  --add Microsoft.Net.Component.4.6.1.SDK --add Microsoft.Net.Component.4.6.2.SDK --add Microsoft.Net.Component.4.7.SDK --add Microsoft.Net.Component.4.7.1.SDK --add Microsoft.Net.Component.4.7.2.SDK -quiet --norestart" -y