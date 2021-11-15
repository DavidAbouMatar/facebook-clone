<?php
session_start();
include("../../config/connection.php");


$id = $_SESSION['id'];

$query = "select p.request_user_id, u.name from pending_requests as p join users as u on p.request_user_id= u.id 
where p.pending_accept_id = ? ";
$stmt = $connection->prepare($query);
$stmt->bind_param("s", $id);
$stmt->execute();
$result = $stmt->get_result();
$temp_array = [];
while($row = $result->fetch_assoc()){
    $temp_array[] = $row;

}

//print_r($temp_array);


$json = json_encode($temp_array, JSON_PRETTY_PRINT);
echo $json;
