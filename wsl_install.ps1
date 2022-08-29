wsl install -d Ubuntu

# Activate WSL2
aria2c.exe https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -o wsl_update_x64.msi | msiexec.exe /i wsl_update_x64.msi /quiet
