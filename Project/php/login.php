<?php
    header("Content-Type: application/json");
    $data = json_decode($_POST['data'], true);
    $FirstName = $data[0]['value'];
    $LastName = $data[1]['value'];
    $Email = $data[2]['value'];
    $host="localhost"; // Host name 
    $username="client"; // Mysql username 
    $password="coen161"; // Mysql password 
    $db_name="KOHW"; // Database name   
    $con = mysqli_connect("$host", "$username", "$password") or die("Connection Problem" . mysqli_errno($con));
    $database = mysqli_select_db($con, "$db_name") or die("SQL Problem" . mysqli_error($con));
  
    $sql="SELECT * FROM RegisteredUser WHERE FirstName='$FirstName' AND LastName='$LastName' AND Email='$Email'";
    $result=mysqli_query($con, $sql);
    
    $user_row=mysqli_fetch_array($result, MYSQLI_ASSOC);
    //if (mysql_num_rows($user_row)==0) { echo "No user found."; }
    //echo $user_row;
    $user_id=$user_row['userID'];
    $registration_sql="SELECT * FROM Registration WHERE userID='$user_id'";
    $result=mysqli_query($con, $registration_sql);
    $registration_row=mysqli_fetch_array($result, MYSQLI_ASSOC);
    //if (mysql_num_rows($registration_row)==0) { echo "No registration found."; }
    //$rows=mysqli_fetch_array($result, MYSQLI_ASSOC);
    $rows = array();
    $rows[] = $user_row;
    $rows[] = $registration_row;
    $encoded = json_encode($rows);
    $jsonArray["status"]=1;
    $jsonArray["data"]=$encoded;
    $jsonArray["msg"]="success - query success";
    mysqli_close($con); 
    $jsonResponse = json_encode($jsonArray);
    echo $jsonResponse;
?>