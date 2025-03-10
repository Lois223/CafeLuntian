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
    echo 'Error: ' . $ex->getMessage();
    exit();
}

// Function to generate a unique Order_ID
function generateOrderID($connection) {
    $currentYearMonth = date("Ym"); // Get current Year and Month (YYYYMM)

    // Get the latest Order_ID from the database
    $query = "SELECT Order_ID FROM customer_order_tbl ORDER BY Order_ID DESC LIMIT 1";
    $result = mysqli_query($connection, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $lastID = $row['Order_ID'];

       
        $lastThreeDigits = (int)substr($lastID, -3);

        // Check if the previous Order_ID belongs to the current Year-Month
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


if (isset($_POST['Checkout'])) {
    
    $Order_ID = generateOrderID($connection);
    $Customer_Name = mysqli_real_escape_string($connection, $_POST['Customer_Name']);
    $Contact = mysqli_real_escape_string($connection, $_POST['Contact']);
    $Email = mysqli_real_escape_string($connection, $_POST['Email']);
    $Order_Name = mysqli_real_escape_string($connection, $_POST['Order_Name']); 
    $Price = mysqli_real_escape_string($connection, $_POST['Price']);
    $Quantity = mysqli_real_escape_string($connection, $_POST['Quantity']);
    $Room_Num = mysqli_real_escape_string($connection, $_POST['Room_Num']);
    $Mode_of_Service = mysqli_real_escape_string($connection, $_POST['Mode_of_Service']);
    $Time = mysqli_real_escape_string($connection, $_POST['Time']);
    $Receipt = null; // Initialize Receipt variable

    // Handle file upload (Receipt)
    if (isset($_FILES['Receipt']) && $_FILES['Receipt']['error'] == 0) {
        $receiptContent = file_get_contents($_FILES['Receipt']['tmp_name']);
        $receiptContent = mysqli_real_escape_string($connection, $receiptContent); 
    } else {
        $receiptContent = null; // No file uploaded
    }
    
    $insert = "INSERT INTO customer_order_tbl (Order_ID, Customer_Name, Contact, Email, Order_Name, Price, Quantity, Room_Num, Mode_of_Service, Time, Receipt)
               VALUES('$Order_ID', '$Customer_Name', '$Contact', '$Email', '$Order_Name', '$Price', '$Quantity', '$Room_Num', '$Mode_of_Service', '$Time', '$receiptContent')";
    
    try {
        $insert_result = mysqli_query($connection, $insert);

        if (!$insert_result) {
            throw new Exception('Insert Query Error in customer_order_tbl: ' . mysqli_error($connection));
        }

        echo '<script>alert("Ordered Successfully!");</script>';
        echo '<script>window.location.assign("menu.php");</script>';
    } catch (Exception $ex) {
        echo 'Error: ' . $ex->getMessage();
    }
}

?>
