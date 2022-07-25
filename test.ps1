Import-Module -Name PureStoragePowerShellSDK
Import-Module -Name PureStoragePowerShellSDK2
Import-Module -Name PureFBModule

$User = 'pureuser'
$Pass = 'pureuser'
$FB = '10.226.224.182'

#Password convert to Secure String
$PWord = ConvertTo-SecureString -String $Pass -AsPlainText -Force

$NUM_READY=Invoke-Pfa2CLICommand -EndPoint $FB -Username $User -Password $PWord -CommandText 'purefs list' | grep smb | grep 45.13G | wc -l

$condition = $true
if ( $condition )
{
    Write-Output "The condition was true"
}

$value = Get-MysteryValue
if ( 5 -eq $value )
{
    # do something
}

echo "Checking K8 Nodes are Ready"
while true; do    
	NUM_READY=Invoke-Pfa2CLICommand -EndPoint $FB -Username $User -Password $PWord -CommandText 'purefs list' | grep smb | grep 45.13G | wc -l
    if [ "${NUM_READY}" == "4" ]; then
        echo "All ${NUM_READY} Kubernetes nodes are ready !"
        break
    else
        echo "Waiting for all Kubernetes nodes to be ready. Current ready nodes: ${NUM_READY}"
        kubectl get nodes
    fi
    sleep 5
done
