<?php
session_start();

$server = 'localhost';
$user = 'root';
$pass ='';
$db = 'cafeluntiandata';

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try{
	$connection = mysqli_connect($server, $user, $pass, $db);
}catch (Exception $ex)
{
	echo'Error';
}

if(isset($_POST['register']))
{
	$User_FName = mysqli_real_escape_string($connection, $_POST['User_FName']);
	$User_LName = mysqli_real_escape_string($connection, $_POST['User_LName']);
	$Contact_Num = mysqli_real_escape_string($connection, $_POST['ContactNo']);
	$Position = mysqli_real_escape_string($connection, $_POST['Position']);
	$Email = mysqli_real_escape_string($connection, $_POST['Email']);
	$Password = mysqli_real_escape_string($connection, $_POST['Password']);

	//insert data to table
	$insert = "INSERT INTO user_tbl (User_FName, User_LName, Contact_Num, Position, Email, Password, Account_Created)
				VALUES('$User_FName','$User_LName', '$Contact_Num', '$Position', '$Email', '$Password', NOW())";

	try{
		$insert_result = mysqli_query($connection, $insert);

		if($insert)
		{
			if(mysqli_affected_rows($connection) > 0)
			{
				print '<script>alert("Sucessfully Registered!");</script>';
				Print '<script>window.location.assign("login.html");</script>';
			}else{
				echo'Data not inserted!';
			}		
		}
	}
	catch (Exception $ex)
	{
		echo 'Error Insert'.$ex -> getMessage();
	}
}
?>
