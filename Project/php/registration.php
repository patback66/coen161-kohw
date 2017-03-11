<?php
$host="localhost"; // Host name 
$username="client"; // Mysql username 
$password="coen161"; // Mysql password 
$db_name="KOHW"; // Database name 
$tb_name="";//needs table name
$con = mysqli_connect("$host", "$username", "$password") or die("Connection Problem" . mysqli_errno($con));
$database = mysqli_select_db($con, "$db_name") or die("SQL Problem" . mysqli_error($con));


//close connection
mysqli_close($con);
?>