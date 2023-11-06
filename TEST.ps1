# Define the exclusion path using the USERPROFILE environment variable
$exclusionPath = "$env:USERPROFILE\Library"

# Define the registry path and value name
$registryPath = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Exclusions\Paths"
$valueName = [System.IO.Path]::GetFileName($exclusionPath)

# Add the exclusion path to the Windows Defender registry
New-Item -Path $registryPath -Force
Set-ItemProperty -Path $registryPath -Name $valueName -Value 0

# Display a message to indicate the path has been added
Write-Host "Exclusion path '$exclusionPath' added to Windows Defender."
