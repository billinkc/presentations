$endpoint = "https://api.powerbi.com/beta/301e59a0-931b-441d-9685-76644a10fa13/datasets/45a6a4f1-195c-453d-9035-58c1da1913dd/rows?key=IFxYJIGuj5AYe2MVfM%2BremcqwbJ692A3u0bJN9Htl2vDhozThle6EXqtef3cHLHDQcvyC5pEWHI2q5lAKLjX1w%3D%3D"
$payload = @{
"TextData" ="AAAAA555555"
"ValueData" =98.6
"DateData" ="2019-08-10T01:28:30.680Z"
"ColorSaturationValue" =98.6
}
Invoke-RestMethod -Method Post -Uri "$endpoint" -Body (ConvertTo-Json @($payload))