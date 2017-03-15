<?php

$host="localhost"; // Host name 
$username="client"; // Mysql username 
$password="coen161"; // Mysql password 
$db_name="KOHW"; // Database name 
$tb_name1="RegisteredUser"; // First Table
$tb_name2="Kids"; // Second Table
$tb_name3="Registration";
$con = mysqli_connect("$host", "$username", "$password") or die("Connection Problem" . mysqli_errno($con));
$database = mysqli_select_db($con, "$db_name") or die("SQL Problem" . mysqli_error($con));
$table1counter=($con->query("SELECT COUNT(*) FROM $tb_name1"));
$table2counter=($con->query("SELECT COUNT(*) FROM $tb_name2"));
$table3counter=($con->query("SELECT COUNT(*) FROM $tb_name3"));
$num_rows1 = mysqli_num_rows($table1counter);
$num_rows2 = mysqli_num_rows($table2counter);
$num_rows3 = mysqli_num_rows($table3counter);
//$num1= $num_rows1[0];
//$num2= $num_rows2[0];

//Getting data from form

$dataform= json_decode($_POST['data'],true);

$LastName=$dataform[1]['value'];
$FirstName=$dataform[0]['value'];
$Email=$dataform[3]['value'];
$Phone=$dataform[4]['value'];
$Street=$dataform[5]['value'];
$City=$dataform[6]['value'];
$State=$dataform[7]['value'];
$Zip=$dataform[8]['value'];
$KidFirstName=$dataform[15]['value'];
$KidLastName=$dataform[16]['value'];
$Allergies=$dataform[12]['value'];
$Grade=$dataform[10]['value'];
$Age=$dataform[17]['value'];
$Comment=$dataform[13]['value'];
$CampLength=$dataform[14]['value'];
$School=$dataform[9]['value'];
$Season="S";
$ActivityID="A001";
//$num_rows1++;
//$num_rows2++;

$sql1="INSERT INTO $tb_name1(userID, LastName, FirstName, Street, City, State, Zip, Email, Phone)VALUES('$num_rows1', '$LastName', '$FirstName', '$Street', '$City', '$State', '$Zip', '$Email', '$Phone')";
$result1=($con->query($sql1));
if($result1 === FALSE)
{
  while($result1 === FALSE)
  {
    $num_rows1++;
    $sql1="INSERT INTO $tb_name1(userID, LastName, FirstName, Street, City, State, Zip, Email, Phone)VALUES('$num_rows1', '$LastName', '$FirstName', '$Street', '$City', '$State', '$Zip', '$Email', '$Phone')";
    $result1=($con->query($sql1));
  }
}
$sql2="INSERT INTO $tb_name2(childID, ParentID, KidLastName, KidFirstName, Grade, School, Allergies, Age, CampLength)VALUES('$num_rows2', '$num_rows1','$KidLastName', '$KidFirstName', '$Grade', '$School', '$Allergies','$Age','$CampLength')";
$result2=($con->query($sql2));
if($result2 === FALSE)
{
  while($result2 === FALSE)
  {
    $num_rows2++;
    $sql2="INSERT INTO $tb_name2(childID, ParentID, KidLastName, KidFirstName, Grade, School, Allergies, Age, CampLength)VALUES('$num_rows2', '$num_rows1','$KidLastName', '$KidFirstName', '$Grade', '$School', '$Allergies','$Age','$CampLength')";
   $result2=($con->query($sql2));  
  }
}
$sql3="INSERT INTO $tb_name3(RegID, UserID, CampLength, Season, ActivityID)VALUES('$num_rows3', '$num_rows1', '$CampLength', '$Season', '$ActivityID')";
$result3=($con->query($sql3));
if($result3 === FALSE)
{
  while($result3 === FALSE)
  {
    $num_rows3++;
    $sql3="INSERT INTO $tb_name3(RegID, UserID, CampLength, Season, ActivityID)VALUES('$num_rows3', '$num_rows1', '$CampLength', '$Season', '$ActivityID')";
    $result3=($con->query($sql3));  
  }
}
if($result1 === TRUE){
  echo "Successful</br>";
  }
  else {
  echo $num_rows1;
  echo "ERROR Result1</br>";
  }
if($result2 === TRUE){
  echo "Successful</br>";
}
else{
  echo $num_rows2;
  echo "ERROR Result2</br>";
}
if($result3 === TRUE){
  echo "Successful</br>";
}
else{
  echo $num_rows3;
  echo "ERROR Result3</br>";
}



//close connection
mysqli_close($con);
?>