<?php
session_start();
include("../../config/connection.php");

if(isset($_POST["id"]) && $_POST["id"] != ""){
    $id = $_POST["id"];


}else{
    die("id");
}

$request_id = $_SESSION['id'];



$x = $connection->prepare("INSERT INTO `pending_requests` ( `request_user_id`, `pending_accept_id`) VALUES ( ?, ?);");
$x->bind_param("ss", $request_id, $id);
$x->execute();
$result = $x;

echo 'sucess';

?>