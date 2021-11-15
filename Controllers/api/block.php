<?php
session_start();
include("../../config/connection.php");


//blocked
if(isset($_POST["id"]) && $_POST["id"] != ""){
    $id = $_POST["id"];


}else{
    die("id");
}

//blocking
$userid = $_SESSION['id'];





$x = $connection->prepare("INSERT INTO `blocked_users` ( `user_blocking_id`, `user_blocked_id`) VALUES ( ?, ?);");	
$x->bind_param("ss", $userid, $id);
$x->execute();
$result = $x;


if($result->affected_rows > 0){
    $delete = $connection->prepare("delete from connections where user1_id= ? and user2_id = ? or user1_id= ? and user2_id = ?");	
    $delete->bind_param("ssss", $user1, $user2, $user2, $user1);
    $delete->execute();
    

}
echo "success";

?>