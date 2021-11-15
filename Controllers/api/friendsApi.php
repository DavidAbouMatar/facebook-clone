<?php
session_start();
include("../../config/connection.php");



$id = $_SESSION['id'];
// echo $id;


$search = $connection->prepare("select name ,last_name, id from  users   where id in (select user2_id from connections where user1_id = ?) UNION select name ,last_name, id  from  users   where id in (select user1_id from connections where user2_id = ?)");	
$search->bind_param("ss", $id, $id); 
$search->execute();
// $result = $delete;

$result = $search->get_result();
$temp_array = [];
// $row = $result->fetch_assoc();
while($row = $result->fetch_assoc()){
    $temp_array[] = $row;

}

$json = json_encode($temp_array, JSON_PRETTY_PRINT);
echo $json;

// select * from  users as u   INNER join connections as c on u.id=c.user1_id
// where c.user1_id = 7
// UNION
// select * from  users as u   INNER join connections as c on u.id=c.user2_id
// where u.id = 7

?>


