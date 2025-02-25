<?php
session_start();

$server = 'localhost';
$user = 'root';
$pass ='';
$db = 'cafeluntiandata';

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try{
	$connection = mysqli_connect($server, $user, $pass, $db);
}

catch (Exception $ex)
{
	echo'Error';
}

if(isset($_POST['Reservation']))
{

	$Full_Name = mysqli_real_escape_string($connection, $_POST['Full_Name']);
    	$Date = mysqli_real_escape_string($connection, $_POST['Date']);
    	$Time = mysqli_real_escape_string($connection, $_POST['Time']);
	$Email = mysqli_real_escape_string($connection, $_POST['Email']);
	$Pax = mysqli_real_escape_string($connection, $_POST['Pax']);

	//insert data to table
	$insert = "INSERT INTO tablereservation_tbl (Full_Name, Reservation_Date, Reservation_Time, Email, Pax, Reservation_Created, Status)
			   VALUES('$Full_Name', '$Date', '$Time', '$Email', '$Pax', NOW(), 'confirmed')";  

try{
    $insert_result = mysqli_query($connection, $insert);
    
    if (!$insert_result) {
        throw new Exception('Insert Query Error in patient_info: ' . mysqli_error($connection));
    }
        echo '<script>alert("Successfully Registered!");</script>';
        echo '<script>window.location.assign("reservation.html");</script>';
    }   
catch (Exception $ex) {
    echo 'Error: ' . $ex->getMessage();
    }
}
?>
