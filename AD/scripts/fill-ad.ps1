# http://technet.microsoft.com/de-de/library/dd378937%28v=ws.10%29.aspx
# http://blogs.technet.com/b/heyscriptingguy/archive/2013/10/29/powertip-create-an-organizational-unit-with-powershell.aspx

Import-Module ActiveDirectory
NEW-ADOrganizationalUnit -name "HADOOP" -path "DC=AD,DC=DAVIDMCGINNIS,DC=NET"
NEW-ADOrganizationalUnit -name "NISSAN" -path "OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET"
NEW-ADOrganizationalUnit -name "SHAW" -path "OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET"
NEW-ADOrganizationalUnit -name "USERS" -path "OU=NISSAN,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET"
NEW-ADOrganizationalUnit -name "USERS" -path "OU=SHAW,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET"
NEW-ADOrganizationalUnit -name "GROUPS" -path "OU=NISSAN,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET"
NEW-ADOrganizationalUnit -name "GROUPS" -path "OU=SHAW,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET"

Import-CSV -delimiter ";" c:\vagrant\scripts\users.csv | foreach {
  New-ADUser -SamAccountName $_.SamAccountName -GivenName $_.GivenName -Surname $_.Surname -Name $_.Name `
             -Path "OU=USERS,OU=SHAW,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET" `
             -AccountPassword (ConvertTo-SecureString -AsPlainText $_.Password -Force) -Enabled $true
  New-ADUser -SamAccountName $_.SamAccountName -GivenName $_.GivenName -Surname $_.Surname -Name $_.Name `
             -Path "OU=USERS,OU=NISSAN,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET" `
             -AccountPassword (ConvertTo-SecureString -AsPlainText $_.Password -Force) -Enabled $true
}

New-ADGroup -Name "Administrators" -SamAccountName Administrators -GroupScope Global -DisplayName "Shaw Administrators" -Path "OU=GROUPS,OU=SHAW,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET"
New-ADGroup -Name "Developers" -SamAccountName Developers -GroupScope Global -DisplayName "Shaw Developers" -Path "OU=GROUPS,OU=SHAW,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET"
New-ADGroup -Name "Data Scientists" -SamAccountName DataScientists -GroupScope Global -DisplayName "Shaw Data Scientists" -Path "OU=GROUPS,OU=SHAW,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET"
New-ADGroup -Name "Administrators" -SamAccountName Administrators -GroupScope Global -DisplayName "Nissan Administrators" -Path "OU=GROUPS,OU=NISSAN,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET"
New-ADGroup -Name "Developers" -SamAccountName Developers -GroupScope Global -DisplayName "Nissan Developers" -Path "OU=GROUPS,OU=NISSAN,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET"
New-ADGroup -Name "Data Scientists" -SamAccountName DataScientists -GroupScope Global -DisplayName "Nissan Data Scientists" -Path "OU=GROUPS,OU=NISSAN,OU=HADOOP,DC=AD,DC=DAVIDMCGINNIS,DC=NET"

