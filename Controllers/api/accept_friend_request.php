<?php
session_start();
include("../../config/connection.php");

if(isset($_POST["id"]) && $_POST["id"] != ""){
    $user1 = $_POST["id"];


}else{
    die("user1");
}

$id = $_SESSION['id'];

$date = date("Y-m-d");




$x = $connection->prepare("INSERT INTO `connections` ( `user1_id`, `user2_id`,`date`  ) VALUES ( ?, ?, ?);");
	
$x->bind_param("sss", $user1, $id, $date);
$x->execute();
$result = $x;


if($result->affected_rows > 0){
    $delete = $connection->prepare("delete from pending_requests where request_user_id=? and pending_accept_id = ?");
    $delete->bind_param("ss", $user1, $id);
    $delete->execute();
}
echo 'sucess';

?>