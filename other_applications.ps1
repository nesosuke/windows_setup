Set-Location ~/Downloads

# NVIDIA Driver
aria2c.exe https://www.nvidia.co.jp/content/DriverDownload-March2009/confirmation.php?url=/Windows/512.95/512.95-desktop-win10-win11-64bit-international-dch-whql.exe -o nvidia-driver.exe | Start-Process nvidia-driver.exe -Wait

# Virtual Desktop Streamer
aria2c.exe https://download.vrdesktop.net/files/VirtualDesktop.Streamer.Setup.exe -o VirtualDesktop.Streamer.Setup.exe | Start-Process VirtualDesktop.Streamer.Setup.exe -Wait

# Logicool G Hub
aria2c.exe https://download01.logi.com/web/ftp/pub/techsupport/gaming/lghub_installer.exe -o lghub_installer.exe | Start-Process lghub_installer.exe -Wait

# nWOL
aria2c.exe https://ftp.vector.co.jp/73/84/2334/nWOLSetup_x64.1.6.74.0.msi -o nWOLSetup_x64.msi | Start-Process msiexec.exe -ArgumentList '/i nWOLSetup_x64.msi /quiet' -Wait

# RunCat
aria2c.exe https://github.com/Kyome22/RunCat_for_windows/releases/download/2.0/RunCat-x64.zip -o RunCat-x64.zip | Expand-Archive RunCat-x64.zip -DestinationPath .

