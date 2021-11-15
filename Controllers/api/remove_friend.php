<?php
session_start();
include("../../config/connection.php");

if(isset($_POST["id"]) && $_POST["id"] != ""){
    $user1 = $_POST["id"];


}else{
    die("user1");
}

$user2 = $_SESSION['id'];





$delete = $connection->prepare("delete from connections where user1_id= ? and user2_id = ? or user1_id= ? and user2_id = ?");	
$delete->bind_param("ssss", $user1, $user2, $user2, $user1);
$delete->execute();
$result = $delete;


if($result->affected_rows > 0){
   
    echo 'sucess';

}

?>