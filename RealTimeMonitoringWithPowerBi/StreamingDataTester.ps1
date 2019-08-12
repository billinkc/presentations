Add-Type -assembly System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

#Function Respond-To-Click
$endpoint = "https://api.powerbi.com/beta/301e59a0-931b-441d-9685-76644a10fa13/datasets/6aab0479-762b-4541-9ee6-95775975cb02/rows?key=Tk%2BjiCatWavoUB6kspHmTZ9O2Qfi0TXS0r80HT3P4n1RROqro37qwqre1Wt5m1fVHp%2F%2BfofEfN4WZ00XJCuaEQ%3D%3D"

$asyncSinblock = 
{
    param($url)
    while ($true)
    {
        for ($theta = 0; $theta -lt 360; $theta++)
        {
            $now = [System.DateTime]::Now
            $nowFormat = Get-Date $now -Format "yyyy-MM-ddThh:mm:ss.FFFZ"
            $payload = @{
                "ActiveReaders" = $theta #Get-Random -Minimum -1 -Maximum 100
                "TargetReaders" =98.6
                "MaxReaders" =98.6
                "MessageCount" =98.6
                "DeliveryTime" =98.6
                "ProcessingTime" =98.6
                "TotalTime" = [Math]::Sin($theta) * [Math]::Sin($theta) * 50
                "MaxTotalTime" =98.6
                "OutboundCount" = Get-Random -Minimum -1 -Maximum 13
                "InboundCount" = Get-Random -Minimum -178 -Maximum 601
                "ErrorCount" = 0
                "TimeStamp" = $nowFormat
                "TargetTranQueueCount" =98.6
                "MaxTranQueueCount" =98.6
                "TargetBatchCount" =98.6
                "MaxBatchCount" =98.6
            }

            Invoke-RestMethod -Method Post -Uri "$url" -Body (ConvertTo-Json @($payload))
            #Write-Host (Get-Random -Minimum -1 -Maximum 100)

            Start-Sleep -Milliseconds 750
        }

    }
}



$asyncblock = {
param($url)
while ($true)
{
$now = [System.DateTime]::Now
$nowFormat = Get-Date $now -Format "yyyy-MM-ddThh:mm:ss.FFFZ"
$payload = @{
"ActiveReaders" =Get-Random -Minimum -1 -Maximum 100
"TargetReaders" =98.6
"MaxReaders" =98.6
"MessageCount" =98.6
"DeliveryTime" =98.6
"ProcessingTime" =98.6
                "TotalTime" = Get-Random -Minimum -72 -Maximum 601
"MaxTotalTime" =98.6
"OutboundCount" = Get-Random -Minimum -1 -Maximum 13
"InboundCount" = Get-Random -Minimum -178 -Maximum 601
"ErrorCount" = 0
"TimeStamp" = $nowFormat
"TargetTranQueueCount" =98.6
"MaxTranQueueCount" =98.6
"TargetBatchCount" =98.6
"MaxBatchCount" =98.6
}
Invoke-RestMethod -Method Post -Uri "$url" -Body (ConvertTo-Json @($payload))
#Write-Host (Get-Random -Minimum -1 -Maximum 100)

Start-Sleep -Milliseconds 1000
}

}


Function Send-Data
{
    param
    (
        [string] $folderName
    ,   [string] $serverName = "localhost\dev2012"
    )

    Start-Job -ScriptBlock $asyncSinblock -ArgumentList @($endpoint) -Name "StreamData"
    #Start-Job -ScriptBlock $asyncblock -ArgumentList @($endpoint) -Name "StreamData"
}

Function Stop-Jobs
{
    param
    (
        [string] $folderName
    ,   [string] $serverName = "localhost\dev2012"
    )
    Get-Job | Stop-Job
    Get-Job | Remove-Job
}

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Streaming Data Tester'
$main_form.Width = 600
$main_form.Height = 400
$main_form.AutoSize = $true


$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(400,10)
$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Text = "Start"
$main_form.Controls.Add($Button)

#$Form.controls.AddRange(@($Button1))

$Button.Add_Click({ Send-Data $this $_ })



$xButton = New-Object System.Windows.Forms.Button
$xButton.Location = New-Object System.Drawing.Size(400,30)
$xButton.Size = New-Object System.Drawing.Size(120,23)
$xButton.Text = "Stop"
$main_form.Controls.Add($xButton)
$xButton.Add_Click({ Stop-Jobs $this $_ })


$main_form.ShowDialog()
