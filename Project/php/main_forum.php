
<?php

$host="localhost"; // Host name 
$username="client"; // Mysql username 
$password="coen161"; // Mysql password 
$db_name="KOHW"; // Database name 
$tbl_name="forum_question"; // Table name 

// Connect to server and select databse.
//mysql_connect("$host", "$username", "$password", "$db_name")or die("cannot connect");
//mysql_select_db("$db_name")or die("cannot select DB");
$con = mysqli_connect("$host", "$username", "$password") or die("Connection Problem" . mysqli_errno($con));
$database = mysqli_select_db($con, "$db_name") or die("SQL Problem" . mysqli_error($con));
$sql="SELECT * FROM $tbl_name ORDER BY id DESC";
// OREDER BY id DESC is order result by descending
$result = mysqli_query($con, $sql);
?>

<table width="90%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#CCCCCC">
<tr>
<td width="6%" align="center" bgcolor="#E6E6E6"><strong>#</strong></td>
<td width="53%" align="center" bgcolor="#E6E6E6"><strong>Topic</strong></td>
<td width="15%" align="center" bgcolor="#E6E6E6"><strong>Views</strong></td>
<td width="13%" align="center" bgcolor="#E6E6E6"><strong>Replies</strong></td>
<td width="13%" align="center" bgcolor="#E6E6E6"><strong>Date/Time</strong></td>
</tr>

<?php
 
// Start looping table row
while($rows=mysqli_fetch_array($result, MYSQLI_ASSOC)){
?>
<tr>
<td bgcolor="#FFFFFF"><?php echo $rows['id']; ?></td>
<td bgcolor="#FFFFFF"><a href="view_topic.php?id=<?php echo $rows['id']; ?>"><?php echo $rows['topic']; ?></a><BR></td>
<td align="center" bgcolor="#FFFFFF"><?php echo $rows['view']; ?></td>
<td align="center" bgcolor="#FFFFFF"><?php echo $rows['reply']; ?></td>
<td align="center" bgcolor="#FFFFFF"><?php echo $rows['datetime']; ?></td>
</tr>

<?php
// Exit looping and close connection 
}
//mysql_close()
mysqli_close($con);
?>

<tr>
<td colspan="5" align="right" bgcolor="#E6E6E6"><a href="create_topic.php"><strong>Create New Topic</strong> </a></td>
</tr>
</table>