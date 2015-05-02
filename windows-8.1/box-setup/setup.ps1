# PowerShell
# NOTE: Run All Windows Updates Before Running This Script
# set execution policy unrestricted for system setup
Set-ExecutionPolicy -ExecutionPolicy Unrestricted


#### Enable Remote Desktop Connection ##########################################

# allow remote connections
(Get-WmiObject -Class "Win32_TerminalServiceSetting" -Namespace root\cimv2\terminalservices).SetAllowTsConnections(1,1) | Out-Null

# add the firewall exception for remote desktop
Set-NetFirewallRule -Name RemoteDesktop-UserMode-In-TCP -Enabled True


#### Enable WinRM ##############################################################

# enable winrm
winrm quickconfig -quiet

# change configuration to work with vagrant
winrm set winrm/config/client/auth @{Basic="true"}
winrm set winrm/config/service/auth @{Basic="true"}
winrm set winrm/config/service @{AllowUnencrypted="true"}

# set the service to automatically start so vagrant will be able to connect
sc config "WinRM" start=auto

# add the firewall exception for winrm
Set-NetFirewallRule -Name WINRM-HTTP-In-TCP-PUBLIC -RemoteAddress Any


#### Enable CredSSP Authentication #############################################

# enable credssp
Enable-WSManCredSSP -Force -Role Server


#### Update Pagefile Settings ##################################################

# disable dynamic pagefile management
$System = GWMI Win32_ComputerSystem -EnableAllPrivileges
$System.AutomaticManagedPagefile = $False
$System.Put()

# set initial and max pagefile size
$CurrentPageFile = gwmi -query "select * from Win32_PageFileSetting where name='c:\\pagefile.sys'"
$CurrentPageFile.InitialSize = 512
$CurrentPageFile.MaximumSize = 2048
$CurrentPageFile.Put()


#### Clean Leftover WinSXS Update Files ########################################

# clean the files!
Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase


#### Run Disk Cleanup Tool #####################################################

# clean more files! (and check all the boxes!)
C:\Windows\System32\cleanmgr.exe /d C:


#### Defrag the Volume #########################################################

# defrag!
Optimize-Volume -DriveLetter C


#### Purge Hidden Data #########################################################

# create temp directory
mkdir .setup-tmp
cd .setup-tmp

# download and extract tool to purge data
wget http://download.sysinternals.com/files/SDelete.zip -OutFile sdelete.zip
[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem")
[System.IO.Compression.ZipFile]::ExtractToDirectory("sdelete.zip", ".")

# run the tool
./sdelete.exe -z C:

# delete the downloaded files
cd ..
Remove-Item -Recurse -Force .setup-tmp
