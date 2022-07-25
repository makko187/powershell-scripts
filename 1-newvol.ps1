Import-Module -Name PureStoragePowerShellSDK
Import-Module -Name PureStoragePowerShellSDK2
$User = 'pureuser'
$Pass = 'pureuser'
$FA = '10.226.224.142'
$FlashArray = Connect-Pfa2Array -EndPoint $FA -UserName $User -Password (ConvertTo-SecureString -String $Pass -AsPlainText -Force) -IgnoreCertificateError
#Array Status
Get-Pfa2Array

#Create Volume
echo 'Create 10G SDKv2-Sample1 volume'  
New-Pfa2Volume -Array $FlashArray -Name 'SDKv2-Sample1' -Provisioned 10737418240 -Verbose

