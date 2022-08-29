# Run as Administrator
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
scoop bucket add extras
scoop install aria2
scoop config aria2-enabled true
