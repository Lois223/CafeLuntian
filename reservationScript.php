<?php
session_start();

$server = 'localhost';
$user = 'root';
$pass = '';
$db = 'cafeluntiandata';

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try {
    $connection = mysqli_connect($server, $user, $pass, $db);
} catch (Exception $ex) {
    echo 'Error';
}

// Function to generate a unique Reservation_ID
function generateReservationID($connection) {
    $currentYearMonth = date("Ym"); // Get current Year and Month (YYYYMM)

    // Get the latest Reservation_ID from the database
    $query = "SELECT Reservation_ID FROM table_reservation_tbl ORDER BY Reservation_ID DESC LIMIT 1";
    $result = mysqli_query($connection, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $lastID = $row['Reservation_ID'];

        // Extract the last three digits
        $lastThreeDigits = (int)substr($lastID, -3);

        // Check if the previous Reservation_ID belongs to the current Year-Month
        if (substr($lastID, 0, 6) == $currentYearMonth) {
            $newThreeDigits = str_pad($lastThreeDigits + 1, 3, "0", STR_PAD_LEFT);
        } else {
            // Reset to 001 if it's a new month
            $newThreeDigits = "001";
        }
    } else {
        // No previous records, start with 001
        $newThreeDigits = "001";
    }

    return $currentYearMonth . $newThreeDigits;
}

if (isset($_POST['Reservation'])) {
    $Full_Name = mysqli_real_escape_string($connection, $_POST['Full_Name']);
    $Date = mysqli_real_escape_string($connection, $_POST['Date']);
    $Time = mysqli_real_escape_string($connection, $_POST['Time']);
    $Email = mysqli_real_escape_string($connection, $_POST['Email']);
    $Pax = mysqli_real_escape_string($connection, $_POST['Pax']);

    // Generate a new Reservation ID
    $Reservation_ID = generateReservationID($connection);

    // Insert data into the table
    $insert = "INSERT INTO table_reservation_tbl (Reservation_ID, Full_Name, Reservation_Date, Reservation_Time, Email, Pax, Reservation_Created, Status)
               VALUES('$Reservation_ID', '$Full_Name', '$Date', '$Time', '$Email', '$Pax', NOW(), 'confirmed')";

    try {
        $insert_result = mysqli_query($connection, $insert);

        if (!$insert_result) {
            throw new Exception('Insert Query Error in table_reservation_tbl: ' . mysqli_error($connection));
        }
        
        echo '<script>alert("Successfully Reserved!");</script>';
        echo '<script>window.location.assign("reservation.php");</script>';
    } catch (Exception $ex) {
        echo 'Error: ' . $ex->getMessage();
    }
}
?>
