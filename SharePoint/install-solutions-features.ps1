Add-SPSolution -LiteralPath C:\Users\Administrator\Documents\packagename.wsp
Update-SPSolution -Identity packagename.wsp -LiteralPath C:\Users\Administrator\Documents\packagename.wsp -GACDeployment
Uninstall-SPSolution -Identity packagename.wsp -WebApplication http://dev
Remove-SPSolution  -Identity packagename.wsp
Install-SPSolution -Identity packagename.wsp -GACDeployment -WebApplication http://dev

Install-SPFeature featurename
Enable-SPFeature featurename -Url http://dev