<?php

include("../../config/connection.php");

if(isset($_POST["user1"]) && $_POST["user1"] != ""){
    $user1 = $_POST["user1"];


}else{
    die("user1");
}

if(isset($_POST["user2"]) && $_POST["user2"] != ""){
    $user2 = $_POST["user2"];


}else{
    die("user2");
}






$delete = $connection->prepare("delete from pending_requests where request_user_id=? and pending_accept_id = ?");	
$delete->bind_param("ss", $user1, $user2);
$delete->execute();
$result = $delete;


if($result->affected_rows > 0){
   
    echo 'sucess';

}

?>