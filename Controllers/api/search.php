<?php
session_start();
include("../../config/connection.php");


$name = $_POST['name'];
$id = $_SESSION['id'];
// echo $id;


$search = $connection->prepare("SELECT Name ,last_name ,id FROM  users WHERE  id NOT IN (SELECT pending_accept_id FROM pending_requests where request_user_id =$id) and id NOT IN (SELECT user_blocked_id FROM blocked_users where user_blocking_id =$id) and id != $id and name LIKE '$name%'");	
// $search->bind_param("ss", $id, $name); 
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

?>