Import-Module -Name PureStoragePowerShellSDK
Import-Module -Name PureStoragePowerShellSDK2
$User = 'pureuser'
$Pass = 'pureuser'
$FA = '10.226.224.142'
$FlashArray = Connect-Pfa2Array -EndPoint $FA -UserName $User -Password (ConvertTo-SecureString -String $Pass -AsPlainText -Force) -IgnoreCertificateError

#Destroy and Eradicate Volume
Remove-Pfa2Volume -Array $FlashArray -Name 'SDKv2-Sample1'
Remove-Pfa2Volume -Array $FlashArray -Name 'SDKv2-Sample1' -Eradicate
