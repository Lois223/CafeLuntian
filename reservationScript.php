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

if(isset($_POST['Reservation']))
{
	/* $Reservation_ID = mysqli_real_escape_string($connection, $_POST['User_FName']);
	$Customer_ID = mysqli_real_escape_string($connection, $_POST['User_LName']); */
	$Full_Name = mysqli_real_escape_string($connection, $_POST['Full_Name']);
    $Date = mysqli_real_escape_string($connection, $_POST['Date']);
    $Time = mysqli_real_escape_string($connection, $_POST['Time']);
	$Email = mysqli_real_escape_string($connection, $_POST['Email']);
	$Pax = mysqli_real_escape_string($connection, $_POST['Pax']);

	//insert data to table
	$insert = "INSERT INTO tablereservation_tbl (Full_Name, Date, Time, Email, Pax, Reservation_Created, Status)
				VALUES('$Full_Name', '$Date', '$Time', '$Email', '$Pax', NOW(), 'confirmed')";  

	try{
		$insert_result = mysqli_query($connection, $insert);

		if($insert)
		{
			if(mysqli_affected_rows($connection) > 0)
			{
				print '<script>alert("Sucessfully Reserved!");</script>';
				Print '<script>window.location.assign("menu.html");</script>';

				use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';


    // Retrieve user's information from the database
    $sql = "SELECT Name FROM tablereservation_tbl"; // Removed extra comma
    $stmt = $conn->prepare($sql);
    // $user_id = $_POST['User_ID']; // Assuming you have a user_id passed from the front end
    // $stmt->bind_param("s", $user_id); // Commented out temporarily
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    $name = $row['Full_Name'];
    $email = $row['Email'];
    $date= $row['Date'];

    // Create a new PHPMailer instance
    $mail = new PHPMailer(true);

    try {
        // SMTP configuration
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';  // Specify SMTP server
        $mail->SMTPAuth = true;
        $mail->Username = 'jewelordanza20@gmail.com'; // SMTP username
        $mail->Password = 'udubuzbesrwsetjz';   // SMTP password
        $mail->SMTPSecure = 'ssl';
        $mail->Port = 465;

        // Sender and recipient settings
        $mail->setFrom($email, $name); // Sender's email and name
        $mail->addAddress('jewelordanza20@gmail.com', 'Cafe Luntian'); // Admin's email and name

        // Email content
        $mail->isHTML(true);
        $mail->Subject = 'Reservation Confirmation – Cafe Luntian: Good Day,' . $name.'!';
        $mail->Body = "
Thank you for choosing Cafe Luntian! We’re delighted to confirm your reservation. Here are the details:<br>Email: $email<br>Reservation Date: $date     "; // Removed $location

        // Send email
        $mail->send();
        echo 'Email has been sent successfully';
    } catch (Exception $e) {
        echo "Email could not be sent. Error: {$mail->ErrorInfo}";
    }
}
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
