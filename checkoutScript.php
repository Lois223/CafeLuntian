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

// Function to generate a unique Customer_ID
function generateCustomerID($connection) {
    $currentYearMonth = date("Ym"); // Get current Year and Month (YYYYMM)

    // Get the latest Customer_ID from the database
    $query = "SELECT Customer_ID FROM customer_order_tbl ORDER BY Customer_ID DESC LIMIT 1";
    $result = mysqli_query($connection, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $lastID = $row['Customer_ID'];

        // Extract the last three digits
        $lastThreeDigits = (int)substr($lastID, -3);

        // Check if the previous Customer_ID belongs to the current Year-Month
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

// Handle form submission and insert data into the database
if (isset($_POST['Checkout'])) {
    // Check if all keys are set before accessing
    $Full_Name = isset($_POST['Full_Name']) ? mysqli_real_escape_string($connection, $_POST['Full_Name']) : null;
    $Email = isset($_POST['Email']) ? mysqli_real_escape_string($connection, $_POST['Email']) : null;
    $Contact = isset($_POST['Contact']) ? mysqli_real_escape_string($connection, $_POST['Contact']) : null;
    $Pax = isset($_POST['Pax']) ? mysqli_real_escape_string($connection, $_POST['Pax']) : null;
    $Date = isset($_POST['Date']) ? mysqli_real_escape_string($connection, $_POST['Date']) : null;
    $Time = isset($_POST['Time']) ? mysqli_real_escape_string($connection, $_POST['Time']) : null;
    $Receipt = null; // Initialize Receipt variable

    // Generate a new Customer_ID
    $Customer_ID = generateCustomerID($connection);

    // Handle file upload (Receipt)
    if (isset($_FILES['Receipt']) && $_FILES['Receipt']['error'] == 0) {
        // Read the file content as binary blob
        $Receipt = file_get_contents($_FILES['Receipt']['tmp_name']);
    }

    // Prepare the query for inserting data into the database
    if ($Receipt !== null) {
        $insert = "INSERT INTO customer_order_tbl (Customer_ID, Customer_Name, Email, Contact, Pax, Customer_Order, Type, Price, Quantity, DP_Amount, Balance_Amount, Receipt, Status, Date, Time)
                   VALUES('$Customer_ID', '$Full_Name', '$Email', '$Contact', '$Pax', '', '', '', '', '', '', '', 'pending', '$Date', '$Time')";

        try {
            $insert_result = mysqli_query($connection, $insert);

            if (!$insert_result) {
                throw new Exception('Insert Query Error in customer_order_tbl: ' . mysqli_error($connection));
            }

            // Redirect back to checkout page with a success message
            header("Location: checkout.php?success=1");
            exit();
        } catch (Exception $ex) {
            echo 'Error: ' . $ex->getMessage();
        }
    }
}
?>