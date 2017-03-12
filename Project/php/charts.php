<?php
function getForumPosts() {
    $host="localhost"; // Host name 
    $username="client"; // Mysql username 
    $password="coen161"; // Mysql password 
    $db_name="KOHW"; // Database name 
    $con = mysqli_connect("$host", "$username", "$password") or die("Connection Problem" . mysqli_errno($con));
    $database = mysqli_select_db($con, "$db_name") or die("SQL Problem" . mysqli_error($con));
    

    $sql="SELECT id,timestamp FROM `b_posts` order by timestamp";
    $result=mysqli_query($con, $sql);
    //$rows=mysqli_fetch_array($result, MYSQLI_ASSOC);
    $rows = array();
    while($r = mysqli_fetch_assoc($result)) {
      $rows[] = $r;
    }
    $encoded = json_encode($rows);
    $jsonArray["status"]=1;
    $jsonArray["data"]=$encoded;
    $jsonArray["msg"]="success - query success";
    mysqli_close($con); 
    $jsonResponse = json_encode($jsonArray);
    return $jsonResponse;
}

function getCampersPerLocation() {
   $host="localhost"; // Host name 
    $username="client"; // Mysql username 
    $password="coen161"; // Mysql password 
    $db_name="KOHW"; // Database name 
    $con = mysqli_connect("$host", "$username", "$password") or die("Connection Problem" . mysqli_errno($con));
    $database = mysqli_select_db($con, "$db_name") or die("SQL Problem" . mysqli_error($con));
  
    $sql="SELECT campid, name, currentKids FROM `Camp`";
    $result=mysqli_query($con, $sql);
    //$rows=mysqli_fetch_array($result, MYSQLI_ASSOC);
    $rows = array();
    while($r = mysqli_fetch_assoc($result)) {
      $rows[] = $r;
    }
    $encoded = json_encode($rows);
    $jsonArray["status"]=1;
    $jsonArray["data"]=$encoded;
    $jsonArray["msg"]="success - query success";
    mysqli_close($con); 
    $jsonResponse = json_encode($jsonArray);
    return $jsonResponse;
}
?>

<?php
header("Content-Type: application/json");
$response = null;
if(isset($_POST['do'])) {
    if ($_POST['do'] === "getForumPosts") {
        $response = getForumPosts();
    } else if 
      ($_POST['do'] === "getCampersPerLocation") {
        $response = getCampersPerLocation();
    } 
}
echo $response;
?>