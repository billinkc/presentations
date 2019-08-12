# ServiceBrokerStreamingMetrics
#            https://api.powerbi.com/beta/301e59a0-931b-441d-9685-76644a10fa13/datasets/6aab0479-762b-4541-9ee6-95775975cb02/rows?key=Tk%2BjiCatWavoUB6kspHmTZ9O2Qfi0TXS0r80HT3P4n1RROqro37qwqre1Wt5m1fVHp%2F%2BfofEfN4WZ00XJCuaEQ%3D%3D
$endpoint = "https://api.powerbi.com/beta/301e59a0-931b-441d-9685-76644a10fa13/datasets/6aab0479-762b-4541-9ee6-95775975cb02/rows?key=Tk%2BjiCatWavoUB6kspHmTZ9O2Qfi0TXS0r80HT3P4n1RROqro37qwqre1Wt5m1fVHp%2F%2BfofEfN4WZ00XJCuaEQ%3D%3D"
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
"TotalTime" = Get-Random -Minimum 350 -Maximum 1324
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
Invoke-RestMethod -Method Post -Uri "$endpoint" -Body (ConvertTo-Json @($payload))

Start-Sleep -Seconds 100
}