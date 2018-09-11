# See the end, we only added  Column Encryption Setting=Enabled;
$connectionString = "Data Source=.\dev2017;Initial Catalog=tempdb;Integrated Security=True;MultipleActiveResultSets=False;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;Packet Size=4096;Column Encryption Setting=Enabled;"

#This is our basic, non-parameterized query
$query = "SELECT * FROM dbo.Patient AS P WHERE P.PatientName = 'River Tam';"

$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString

$command = New-Object System.Data.SqlClient.SqlCommand
$command.CommandText = $query
$command.Connection = $connection


$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $command
$DataSet = New-Object System.Data.DataSet
$ignore = $SqlAdapter.Fill($DataSet)
$connection.Close()

#print the results
$DataSet.Tables[0]