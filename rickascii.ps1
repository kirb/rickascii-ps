$host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size 80, 25
[Console]::TreatControlCAsInput = $True
.\rickascii.exe

$playerScript = @'
	$player = New-Object -ComObject "MediaPlayer.MediaPlayer"
	$player.Open("rickascii.wav")
	$player
'@

$runspacePlayer = [RunspaceFactory]::CreateRunspace()
$runspacePlayer.ApartmentState = "MTA"

$backgroundPlayer = [PowerShell]::Create()
$backgroundPlayer.Runspace = $runspace

$runspacePlayer.Open()
$player = @($backgroundPlayer.AddScript($playerScript).Invoke())[0]

While ($true) {
	If ($player.HasError -or ($player.ReadyState -eq 4)) {
		break
	}
}

Clear-Host
$i = 0

Get-Content rickascii.frames | ForEach {
	Write-Host $_

	If ($i % 24 -eq 0) {
		$host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates 0, 0
		Start-Sleep -Milliseconds 5.5
	}

	$i++
}

Clear-Host
$player.Stop()
$backgroundPlayer.Dispose()
