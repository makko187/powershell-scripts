Import-Module -Name PureStoragePowerShellSDK
Import-Module -Name PureStoragePowerShellSDK2
Import-Module -Name PureFBModule

$User = 'pureuser'
$Pass = 'pureuser'
$FB = '10.226.224.182'

#Password convert to Secure String
$PWord = ConvertTo-SecureString -String $Pass -AsPlainText -Force

#Build Credential Token of FA / FB
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord

#Run command on FB to Run FS list 
#New-PfaCLICommand -EndPoint $FB -Credentials $Credential -CommandText 'purefs list'

Get-Command -Module PureFBModule

Get-PfbArray      
