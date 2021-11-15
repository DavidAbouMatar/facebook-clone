<?php
	session_start();
	
	include("../config/connection.php");

	if(isset($_POST["first_name"]) && $_POST["first_name"] != ""){
		$name = $_POST["first_name"];
	

	}else{
		die("first_name");
	}

	if(isset($_POST["password"]) && $_POST["password"] != ""){

		$password = hash('sha256', $_POST['password']);
		$pass =$_POST["password"];
	}else{
	
		die("password");
	}

	if(isset($_POST["email"]) && $_POST["email"] != ""){
		$email = $_POST["email"];
		if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
			header("Location:../index.html?error=wrong email format!");
		  }

	}else{
		die("email");
	}

	if(isset($_POST["last_name"]) && $_POST["last_name"] != ""){
		$last_name= $_POST["last_name"];

	}else{
		die("last_name");
	}
	if(isset($_POST["date"]) && $_POST["date"] != ""){
		$date= $_POST["date"];

	}else{
		die("date");
	}
	if(isset($_POST["gender"]) && $_POST["gender"] != ""){
		$gender= $_POST["gender"];

	}else{
		die("gender");
	}
	if(isset($_POST["city"]) && $_POST["city"] != ""){
		$city= $_POST["city"];

	}else{
		die("city");
	}
	if(isset($_POST["country"]) && $_POST["country"] != ""){
		$country= $_POST["country"];

	}else{
		die("country");
	}




	
	$x = $connection->prepare("INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `password`, `gender`, `date_of_birth`, `country`, `city`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?);");
	
	$x->bind_param("ssssssss",$name,$last_name, $email, $password, $gender, $date, $country, $city);
	
	$x->execute();
	$result = $x;
	//if query is executed seccefully affected_rows = 1 else its -1
	if($result->affected_rows > 0){
		$_SESSION['email'] = $email;
		$_SESSION['password'] = $pass;
	
	
		$x->close();
		$connection->close();
		header("Location:./login.php");
		}else{
			
		$x->close();
		$connection->close();
		header("Location:../index.html?error=Email already exists!");
	}


?>