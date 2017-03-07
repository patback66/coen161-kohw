<?php

$host="localhost"; // Host name 
$username="client"; // Mysql username 
$password="coen161"; // Mysql password 
$db_name="KOHW"; // Database name 
$tbl_name="forum_question"; // Table name 

// Connect to server and select database.
mysql_connect("$host", "$username", "$password", "$db_name")or die("cannot connect"); 
mysql_select_db("$db_name")or die("cannot select DB");
/*try {
   $conn = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
   $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e)
{
   echo "Connection failed: " . $e->getMessage();
}*/

// get data that sent from form 
$topic=$_POST['topic'];
$detail=$_POST['detail'];
$name=$_POST['name'];
$email=$_POST['email'];

$datetime=date("d/m/y h:i:s"); //create date time

$sql="INSERT INTO $tbl_name(topic, detail, name, email, datetime)VALUES('$topic', '$detail', '$name', '$email', '$datetime')";
$result=mysql_query($sql);

if($result){
echo "Successful<BR>";
echo "<a href=main_forum.php>View your topic</a>";
}
else {
echo "ERROR";
}
mysql_close();
?>