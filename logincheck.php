<?php 
session_start();

include_once('.\templates\db_conx.php'); 

$uoe = $_POST["uoe"];
$p = $_POST["p"];
$hashp = md5($p);

$sql = "SELECT `username`, `email`, `password`, `activated` FROM `users` WHERE `username`='$uoe' OR `email`='$uoe' LIMIT 1";

$query = mysqli_query($db_conx,$sql);
$row = mysqli_fetch_row($query);

$du = $row[0];
$de = $row[1];
$dp = $row[2];
$da = $row[3];

if(mysqli_num_rows($query)<1){
	echo 'you are not registered yet!';
	exit();
	}
else if($da=='0'){
	echo 'your account is not activated yet, first activate your account and then login';
	exit();
	}
else if($dp!=$hashp){
	echo 'your username and password not matched!';
	exit();
	}
else{
	$_SESSION["user_logged"]=$du;
	echo $du;
	//header("Location: http://localhost/SocialNetworkingApp/profile.php?u=$du");
	exit();
	}

?>