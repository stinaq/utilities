asnp microsoft.sharepoint.powershell

Set-Service -Name "IISADMIN" -StartupType Automatic -ComputerName $env:COMPUTERNAME
$IISADMIN = Get-Service "IISADMIN" -ComputerName $env:COMPUTERNAME
$IISADMIN.start();

$SPTraceV4 = Get-Service "SPTraceV4" -ComputerName $env:COMPUTERNAME
$SPTraceV4.start();

$SPAdminV4 = Get-Service "SPAdminV4" -ComputerName $env:COMPUTERNAME
$SPAdminV4.start();

$OSearch15 = Get-Service "OSearch15" -ComputerName $env:COMPUTERNAME
$SPSearchHostController = Get-Service "SPSearchHostController" -ComputerName $env:COMPUTERNAME
$SPSearchHostController.start();
$OSearch15.start();

###Resuming Search Service Application if paused### 
#Write-Host "Resuming the Search Service Application" -ForegroundColor Yellow 
#$ssa = Get-SPEnterpriseSearchServiceApplication
#$ssa.resume();

#Start cache
$instanceName ="SPDistributedCacheService Name=AppFabricCachingService"
$serviceInstance = Get-SPServiceInstance | ? {($_.service.tostring()) -eq $instanceName -and ($_.server.name) -eq $env:computername}
$serviceInstance.Provision();

################## 
##Start Services## 
################## 
Write-Host "Starting Services" -ForegroundColor Yellow 

$SPUserCodeV4 = Get-Service "SPUserCodeV4" -ComputerName $env:COMPUTERNAME
$SPUserCodeV4.start();

$SPTimerV4 = Get-Service "SPTimerV4" -ComputerName $env:COMPUTERNAME
$SPTimerV4.start();

Write-Host "Services are Started" -ForegroundColor Green 