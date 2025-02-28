<?php
  session_start();
  include('mycon.php');
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reservation | Cafe Luntian</title>
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
          <a href="adminOrder.php"><span class="material-symbols-outlined">list_alt</span>Order</a>
        </li>
        <li>
          <a href="adminReservation.php" class="active"><span class="material-symbols-outlined">book</span>Reservation</a>
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
            <h3><?php echo $_SESSION['User_FName']." ".$_SESSION['User_LName']; ?></h3>
            <span>Admin</span>
          </div>
        </div>
      </div>
    </aside>

    <main class="main">
        <header>
            <h1>Reservation List</h1>
        </header>

        <section class="search">
            <a href="#" class="search-icon"><i class="fas fa-search"></i></a>
            <input type="text" id="searchInput" placeholder="Search Name or ID here" >   
        </section>

        <section class="search-result">
            <h1>Search Results</h1><hr>
            <div class="box-container" id="reservationList">
                <!-- PHP START HERE -->
                <?php
                include('mycon.php');
                $sql = "SELECT * FROM table_reservation_tbl";
                $result = $connection->query($sql);
                echo '<div class="table-wrapper">';
                echo "<table id='userTable' border='1' width='100%'>";
                echo "<tr align='center' class=tblheader>
                        <td><b>Reservation_ID</b></td>
                        <td><b>Full Name</b></td>
                        <td><b>Reservation_Date</b></td>
                        <td><b>Reservation_Time</b></td>
                        <td><b>Email</b></td>
                        <td><b>Number of Guests</b></td>
                        <td><b>Reservation Created</b></td>
                        <td><b>Status</b></td>
                      </tr>";
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        $Reservation_ID = $row['Reservation_ID'];
                        echo'<tr>
                                <td class="user-id">'.$row['Reservation_ID'].'</td>
                                <td class="user-name">'.$row['Full_Name'].'</td>
                                <td>'.$row['Reservation_Date'].'</td>  
                                <td>'.$row['Reservation_Time'].'</td>
                                <td>'.$row['Email'].'</td>    
                                <td>'.$row['Pax'].'</td>   
                                <td>'.$row['Reservation_Created'].'</td>   
                                <td>'.$row['Status'].'</td>   
                                <td>
                                  <a class="remove-row-button" href="DeletionQueries.php?act=DeleteUser&Reservation_ID=' . urlencode($row['Reservation_ID']) . '" onclick="return confirm(\'Are you sure you want to delete this account?\');" class="icon-button">
                                      <i class="fas fa-trash-alt"></i>
                                  </a>
                                </td>                             
                            </tr>';
                    }
                } else {
                     echo "<tr><td colspan='9' align='center'>No results found.</td></tr>";
                  }
                echo "</table>";
                echo '</div>';
              ?>
            </div>
        </section>
    </main>

    <script src="main.js"></script>
    <script>
      //search bar input
      const searchInput = document.getElementById("searchInput");
      const userTable = document.getElementById("userTable");
      const tableRows = userTable.getElementsByTagName("tr");

      // Listen for input events 
      searchInput.addEventListener("input", function () {
        const searchTerm = searchInput.value.toLowerCase();

        // Loop through all rows in the table 
        for (let i = 1; i < tableRows.length; i++) {
            const row = tableRows[i];
            const userId = row.getElementsByClassName("user-id")[0].innerText.toLowerCase();
            const userName = row.getElementsByClassName("user-name")[0].innerText.toLowerCase();

            // Check if the search term is in the User ID or User Name
            if (userId.includes(searchTerm) || userName.includes(searchTerm)) {
                row.style.display = ""; // Show row if it matches
            } else {
                row.style.display = "none"; // Hide row if it doesn't match
            }
        }
      });
    </script>

</html>
