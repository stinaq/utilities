asnp microsoft.sharepoint.powershell
####################### 
##Stop Other Services## 
####################### 
Set-Service -Name "IISADMIN" -StartupType Disabled -ComputerName $env:COMPUTERNAME
Write-Host "Gracefully stopping IIS W3WP Processes" -ForegroundColor Yellow 
Write-Host 
iisreset -stop -noforce 
Write-Host "Stopping Services" -ForegroundColor Yellow 
Write-Host 

$SPTimerV4 = Get-Service "SPTimerV4" -ComputerName $env:COMPUTERNAME
if($SPTimerV4.status -eq "Running") {
  $SPTimerV4.stop()
} 

$SPUserCodeV4 = Get-Service "SPUserCodeV4" -ComputerName $env:COMPUTERNAME
if($SPUserCodeV4.status -eq "Running") {
  $SPUserCodeV4.stop()
}

Write-Host "Services are Stopped" -ForegroundColor Green 

#Stop cache
$instanceName ="SPDistributedCacheService Name=AppFabricCachingService"
$serviceInstance = Get-SPServiceInstance | ? {($_.service.tostring()) -eq $instanceName -and ($_.server.name) -eq $env:computername}
$serviceInstance.Unprovision();

######################## 
##Stop Search Services## 
######################## 

$OSearch15 = Get-Service "OSearch15" -ComputerName $env:COMPUTERNAME
$SPSearchHostController = Get-Service "SPSearchHostController" -ComputerName $env:COMPUTERNAME

if(($OSearch15.status -eq "Running") -or ($SPSearchHostController.status -eq "Running")) { 
#  Write-Host "Pausing the Search Service Application" -foregroundcolor Yellow 
#  Write-Host "This could take a few minutes" -ForegroundColor Yellow 
#  $ssa = Get-SPEnterpriseSearchServiceApplication 
#  $ssa.pause();
} 

Write-Host "Stopping Search Services if they are running" -ForegroundColor Yellow 
if($OSearch15.status -eq "Running") { 
  $OSearch15.stop();
}

if($SPSearchHostController.status -eq "Running") { 
  $SPSearchHostController.stop();
} 

do { 
  $srv6 = Get-Service "SPSearchHostController" 
  if($srv6.status -eq "Stopped") 
  { 
      $yes = 1;
  } 
  Start-Sleep -seconds 10 
} until ($yes -eq 1)

Write-Host "Search Services are stopped" -ForegroundColor Green 
Write-Host 

$SPTraceV4 = Get-Service "SPTraceV4" -ComputerName $env:COMPUTERNAME
if($SPTraceV4.status -eq "Running") {
  $SPTraceV4.stop();
}

$SPAdminV4 = Get-Service "SPAdminV4" -ComputerName $env:COMPUTERNAME
if($SPAdminV4.status -eq "Running") {
  $SPAdminV4.stop();
}
