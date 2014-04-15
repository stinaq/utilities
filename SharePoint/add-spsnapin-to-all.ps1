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

#In the opened file, run the following