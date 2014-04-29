####################################################
#
#
# How to add "Add-SPSnapin" to every powershell window , forever
#
#
####################################################

#Open Powershell ISE, run following:

if (!(test-path $profile.AllUsersAllHosts)) {new-item -type file -path $profile.AllUsersAllHosts –force}
powershell_ise $profile.AllUsersAllHosts

#In the opened file, paste the following and then save the file

$ver = $host | select version
if ($ver.Version.Major -gt 1) {$host.Runspace.ThreadOptions = "ReuseThread"} 
if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null) 
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}
