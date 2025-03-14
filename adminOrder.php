<?php
session_start();
include('mycon.php');
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order | Cafe Luntian</title>
    <link rel="icon" type="image/png" sizes="32x32" href="img/logo2.png">
    <link rel="stylesheet" href="style3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://kit.fontawesome.com/1e3d5daa34.js" crossorigin="anonymous"></script>
    <style>
       .table-wrapper {
          overflow-x: auto; 
          width: 100%;
        }
    </style>
</head>
<body>
<body>
    <aside class="sidebar">
      <div class="sidebar-header">
        <img src="img/logo3.png" alt="logo" />
        <h2>Cafe Luntian</h2>
      </div>

      <ul class="sidebar-links">
        <h4>
          <span>Main Menu</span>
          <div class="menu-separator"></div>
        </h4>
        <li>
          <a href="adminDashboard.php"><span class="material-symbols-outlined">dashboard</span>Dashboard</a>
        </li>
        <li>
          <a href="adminOrder.php"  class="active"><span class="material-symbols-outlined">list_alt</span>Order</a>
        </li>
        <li>
          <a href="adminReservation.php"><span class="material-symbols-outlined">book</span>Reservation</a>
        </li>

        <h4>
          <span>Account</span>
          <div class="menu-separator"></div>
        </h4>
        <li>
          <a href="profile.php"><span class="material-symbols-outlined">account_circle</span>Profile</a>
        </li>
        <li>
          <a href="login.php"><span class="material-symbols-outlined">logout</span>Logout</a>
        </li>
      </ul>

      <div class="user-account">
        <div class="user-profile">
          <img src="img/profile.png" alt="Profile Image" />
          <div class="user-detail">
            <h3><?php echo $_SESSION['FName']." ".$_SESSION['LName']; ?></h3>
            <span>Admin</span>
          </div>
        </div>
      </div>
    </aside>

    <main class="main">
        <header>
          <h1>Order List</h1>
        </header>

        <section class="search">
              <a href="#" class="search-icon"><i class="fas fa-search"></i></a>
              <input type="text" id="searchInput" placeholder="Search Name or ID here" >   
        </section>

        <section class="search-result">
          <h1>Search Results</h1><hr>
            <div class="table-wrapper">
            <?php
                include('mycon.php');

                $sql = "SELECT 
                            c.Order_ID, c.Customer_Name, c.Contact, c.Email, c.Room_Num, c.Mode_of_Service, c.Time,
                            i.Item_Name, i.Quantity, i.Price, i.Subtotal, i.Add_Ons, i.Add_Ons_Price
                        FROM customer_order_tbl c
                        LEFT JOIN order_items_tbl i ON c.Order_ID = i.Order_ID
                        ORDER BY c.Order_ID DESC";

                $result = $connection->query($sql);

                echo "<table id='userTable' border='1' width='100%'>";
                echo "<tr align='center' class='tblheader'>
                        <td><b>Order ID</b></td>
                        <td><b>Customer Name</b></td>
                        <td><b>Item (Add-Ons)</b></td>
                        <td><b>Quantity</b></td>
                        <td><b>Item Price</b></td>
                        <td><b>Add-On Price</b></td>
                        <td><b>Total</b></td> 
                        <td><b>Subtotal</b></td> 
                        <td><b>Contact</b></td>
                        <td><b>Email</b></td>
                        <td><b>Time</b></td>
                        <td><b>Room Num</b></td>
                        <td><b>Mode of Service</b></td>
                        <td><b>Actions</b></td>
                      </tr>";

                if ($result->num_rows > 0) {
                    $prevOrderID = null;
                    $rowspanCount = [];
                    $orderTotal = [];

                    // calculate row spans and order totals
                    while ($row = $result->fetch_assoc()) {
                        if (!isset($rowspanCount[$row['Order_ID']])) {
                            $rowspanCount[$row['Order_ID']] = 1;
                            $orderTotal[$row['Order_ID']] = 0;
                        } else {
                            $rowspanCount[$row['Order_ID']]++;
                        }
                        $orderTotal[$row['Order_ID']] += $row['Subtotal'];
                    }

                    // reset result pointer and fetch again
                    $result->data_seek(0);
                    $orderRowspan = [];

                    while ($row = $result->fetch_assoc()) {
                        $Order_ID = $row['Order_ID'];
                        $isFirstRow = ($Order_ID != $prevOrderID);
                        $formattedTime = date("h:i A", strtotime($row['Time'])); 
                        $roomNumber = ($row['Mode_of_Service'] === "Pickup") ? "---" : $row['Room_Num'];

                        // combine Item Name and Add-Ons
                        $itemWithAddOns = $row['Item_Name'];
                        if (!empty($row['Add_Ons'])) {
                            $itemWithAddOns .= " (" . $row['Add_Ons'] . ")";
                        }

                        echo '<tr>';

                        if ($isFirstRow) {
                            $orderRowspan[$Order_ID] = $rowspanCount[$Order_ID];

                            echo '<td rowspan="' . $orderRowspan[$Order_ID] . '" class="user-id">' . $row['Order_ID'] . '</td>';
                            echo '<td rowspan="' . $orderRowspan[$Order_ID] . '" class="user-name">' . $row['Customer_Name'] . '</td>';
                        }

                        echo '<td>' . $itemWithAddOns . '</td>'; 
                        echo '<td>' . $row['Quantity'] . '</td>';
                        echo '<td>' . number_format($row['Price'], 2) . '</td>';
                        echo '<td>' . (!empty($row['Add_Ons_Price']) ? number_format($row['Add_Ons_Price'], 2) : '0.00') . '</td>'; 
                        echo '<td>' . number_format($row['Subtotal'], 2) . '</td>'; 

                        if ($isFirstRow) {
                            echo '<td rowspan="' . $orderRowspan[$Order_ID] . '"><b>' . number_format($orderTotal[$Order_ID], 2) . '</b></td>'; 
                            echo '<td rowspan="' . $orderRowspan[$Order_ID] . '">' . $row['Contact'] . '</td>';
                            echo '<td rowspan="' . $orderRowspan[$Order_ID] . '">' . $row['Email'] . '</td>';
                            echo '<td rowspan="' . $orderRowspan[$Order_ID] . '">' . $formattedTime . '</td>';
                            echo '<td rowspan="' . $orderRowspan[$Order_ID] . '">' . $roomNumber . '</td>';
                            echo '<td rowspan="' . $orderRowspan[$Order_ID] . '">' . $row['Mode_of_Service'] . '</td>';
                            echo '<td rowspan="' . $orderRowspan[$Order_ID] . '">
                                    <a class="remove-row-button" href="DeletionQueries.php?act=DeleteOrder&Order_ID=' . urlencode($row['Order_ID']) . '" 
                                    onclick="return confirm(\'Are you sure you want to delete this order?\');">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                  </td>';
                        }

                        echo '</tr>';

                        $prevOrderID = $Order_ID;
                    }
                } else {
                    echo "<tr><td colspan='14' align='center'>No orders found.</td></tr>";
                }

                echo "</table>";
                ?>

            </div>
        </section>
    </main>

    <script src="main.js"></script>
</body>
</html>
