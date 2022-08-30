# Set up scoop
try {
    Get-Command scoop -ErrorAction Stop
}
catch {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
    scoop install aria2 git sudo
    scoop config aria2-enabled true
    scoop bucket add extras
    scoop bucket add nerd-fonts
    ## Install apps via scoop
    scoop install `
        7zip          `
        ghostscript   `
        googlechrome  `
        grep          `
        iperf3        `
        nodejs        `
        miktex        `
        nuget         `
        oh-my-posh    `
        pandoc        `
        python        `
        unzip         `
        vim           `
        ## Install fonts via scoop
        scoop install `
        CascadiaCode  `
        FiraCode      `
        Hack          `
        JetBrainsMono `
        Meslo         `
        SourceCodePro `
        Ubuntu        `
        UbuntuMono    `
        VictorMono    `
        ZillaSlab     `

}

# Setup Winget(Preview)
try {
    Get-Command winget -ErrorAction Stop
}
catch {
    Invoke-WebRequest https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -o Microsoft.VCLibs.x64.14.00.Desktop.appx
    Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
    Invoke-WebRequest https://github.com/microsoft/winget-cli/releases/download/v1.4.2161-preview/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -o winget.msixbundle
    Add-AppxPackage .\winget.msixbundle
}

try {
    Find-Package -Name WinSCP -ErrorAction Stop | Out-Null
}
catch {
    # Install apps via winget
    winget install --id Bitwarden.Bitwarden
    winget install --id CPUID.HWMonitor
    winget install --id Cloudflare.Warp
    winget install --id Discord.Discord
    winget install --id Docker.DockerDesktop
    winget install --id GitHub.GitLFS
    winget install --id Google.ChromeRemoteDesktop
    winget install --id Google.JapaneseIME
    winget install --id JAMSoftware.TreeSize.Free
    winget install --id Keybase.Keybase
    winget install --id Microsoft.Teams
    winget install --id Microsoft.VisualStudioCode --override "/silent /mergetasks=""addcontextmenufiles,addcontextmenufolders,addtopath,assiciatewithfiles"""
    winget install --id Microsoft.WindowsTerminal
    winget install --id Microsoft.Office
    winget install --id Microsoft.PowerToys
    winget install --id Microsoft.PowerShell
    winget install --id Mozilla.Firefox
    winget install --id 9NVMNJCR03XV # MSI Center
    winget install --id Nvidia.Broadcast
    winget install --id Nvidia.GeForceExperience
    winget install --id OBSProject.OBSStudio
    winget install --id OpenVPNTechnologies.OpenVPN
    winget install --id OrbxSimulationSystems.Volanta
    winget install --id Parsec.Parsec
    winget install --id QL-Win.QuickLook
    winget install --id SumatraPDF.SumatraPDF
    winget install --id SlackTechnologies.Slack
    winget install --id Spotify.Spotify
    winget install --id Twilio.Authy
    winget install --id UnityTechnologies.UnityHub
    winget install --id Valve.Steam
    winget install --id VideoLAN.VLC
    winget install --id WinSCP.WinSCP
}


# Set up WSL2
try {
    Get-Command Ubuntu -ErrorAction Stop
}
catch {
    ## Install Ubuntu latest
    sudo wsl --install -d Ubuntu
    ## Activate WSL2 kernel
    Invoke-WebRequest https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi -o wsl_update_x64.msi ; cmd /c "msiexec.exe /i wsl_update_x64.msi /quiet"
    wsl --set-default-version 2
}


# Set up Hyper-V (requires reboot, run as admin)
sudo Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All


# Set up Windows Sandbox
sudo Enable-WindowsOptionalFeature -Online -FeatureName Containers-DisposableClientVM -All


# Set up Other Apps
Set-Location ~\Downloads
## nWOL
Invoke-WebRequest https://ftp.vector.co.jp/73/84/2334/nWOLSetup_x64.1.6.74.0.msi -o nWOLSetup_x64.msi
try {
    cmd /c "msiexec.exe /i nWOLSetup_x64.msi /quiet"
}
catch {
    Write-Output "nWOL was failed to download."
}
## RunCat
Invoke-WebRequest https://github.com/Kyome22/RunCat_for_windows/releases/download/2.0/RunCat-x64.zip -o RunCat-x64.zip
try {
    Write-Output y | unzip RunCat-x64.zip
}
catch {
    Write-Output "RunCat was failed to download."
}
Set-Location ~\

# Set up Windows Terminal
## Get setting.json
Invoke-WebRequest https://gist.github.com/nesosuke/441566dc09864b04efe36de83f472ccb -o ~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json

# Set up Oh-My-Posh
## Get theme
try {
    Set-Location ~\github.com -ErrorAction Stop
}
catch {
    New-Item -ItemType Directory -Path ~\github.com
}
try {
    Set-Location ~\github.com\oh-my-posh -ErrorAction Stop
}
catch {
    git clone https://github.com/nesosuke/oh-my-posh.git ~\github.com\oh-my-posh
}
try {
    Get-Item ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -ErrorAction Stoprror
}
catch {
    New-Item -ItemType Directory -Path ~\Documents\PowerShell | Out-Null
}
Write-Output "oh-my-posh.exe init pwsh --config ~\github.com\oh-my-posh\themes\custom.omp.json | Invoke-Expression" > ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
