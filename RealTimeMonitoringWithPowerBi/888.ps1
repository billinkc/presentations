$endpoint = "https://api.powerbi.com/beta/301e59a0-931b-441d-9685-76644a10fa13/datasets/692d5a7f-3224-4f13-8cff-f3021e8fa8a5/rows?key=8VY%2BQlilQvDh6QVhB7c%2BQZq9GpuAvxyQtMzCvHNG%2BLST1yu656GJcei1BnHW7nR9%2F4MOG1oIxzP1GxuPWSLDJg%3D%3D"
$payload = @{
"AttendeeCount" =100
"SOmeTextField" ="AAAAA555555"
"TheDate" ="2019-08-10T14:59:54.272Z"
}
Invoke-RestMethod -Method Post -Uri "$endpoint" -Body (ConvertTo-Json @($payload))