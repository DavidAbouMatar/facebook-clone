<?php
session_start();
include("../../config/connection.php");



$uid = $_SESSION['id'];


if(isset($_POST["name"]) && $_POST["name"] != ""){
    $name = $_POST["name"];


}else{
    die("name");
}

if(isset($_POST["last_name"]) && $_POST["last_name"] != ""){
    $last_name = $_POST["last_name"];


}else{
    die("last_name");
}
if(isset($_POST["gender"]) && $_POST["gender"] != ""){
    $gender = $_POST["gender"];


}else{
    die("gender");
}

if(isset($_POST["date_of_birth"]) && $_POST["date_of_birth"] != ""){
    $date_of_birth = $_POST["date_of_birth"];


}else{
    die("date_of_birth");
}

if(isset($_POST["country"]) && $_POST["country"] != ""){
    $country = $_POST["country"];


}else{
    die("country");
}

if(isset($_POST["city"]) && $_POST["city"] != ""){
    $city = $_POST["city"];


}else{
    die("city");
}




$x = $connection->prepare("update users set name=?,last_name=?,gender=?,date_of_birth=?,country=?,city=? where id=?");
$x->bind_param("sssssss", $name, $last_name, $gender, $date_of_birth, $country, $city,$uid);
$x->execute();
$result = $x;


echo "success";
    



?>