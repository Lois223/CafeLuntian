
<?php
    session_start();
    include('mycon.php');
    include('counter.php')
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard | Cafe Luntian</title>
    <link rel="icon" type="image/png" sizes="32x32" href="img/logo2.png">
    <link rel="stylesheet" href="style3.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://kit.fontawesome.com/1e3d5daa34.js" crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body>
    <div class="nav__toggle" id="nav-toggle">
      <i class="uil uil-bars"></i>
   </div>
    <aside class="sidebar" id="sidebar">
      <nav class="nav">
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
            <a href="adminDashboard.php"  class="active"><span class="material-symbols-outlined">dashboard</span>Dashboard</a>
          </li>
          <li>
            <a href="adminOrder.php"><span class="material-symbols-outlined">list_alt</span>Order</a>
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
              <h3><?php echo $_SESSION['User_FName']." ".$_SESSION['User_LName']; ?></h3>
              <span>Admin</span>
            </div>
          </div>
        </div>
  
        <div class="nav__close" id="nav-close">
          <i class="uil uil-times"></i>
        </div>
      </nav>
    </aside>

    <main class="main">

    <div class="flex-1 p-6">
      <header class="flex items-center justify-between">
        <div>
          <h1 class="text-4xl font-bold text-[#356D59]">
          Dashboard
          </h1>
          <p class="text-[#41a884]">
          Welcome to Cafe Luntian Admin!
          </p>
        </div>

        <div class="flex items-center">
          <input class="px-10 py-2 border rounded-lg" placeholder="Search here..." type="text"/>
            <i class="ml-4 fas fa-search text-gray-600">
            </i>
            <i class="ml-4 fas fa-bell text-gray-600">
            </i>
            <i class="ml-4 fas fa-cog text-gray-600">
            </i>
            <div class="ml-4 flex items-center">
            <img alt="User Avatar" class="rounded-full" height="40" src="img/profile.png" width="40"/>
            <div class="ml-2">
              <p class="font-bold">
              <?php echo $_SESSION['User_FName'] . ' ' . $_SESSION['User_LName']; ?>
              </p>
              <p class="text-sm text-gray-600">
              Admin
              </p>
            </div>
            </div>
        </div>
      </header>

      <div class="grid grid-cols-1 gap-6 mt-6 md:grid-cols-2 lg:grid-cols-4">
      <a href="adminReservation.php">
        <div class="p-6 bg-gradient-to-r from-[#3b7f68] to-[#58a289] rounded-lg shadow-md text-white transition-transform duration-300 hover:scale-105">
          <div class="flex items-center justify-between">
            <div>
              <h2 class="text-4xl font-bold">
              <?php  echo "<p>$totalReservations</strong></p>"; ?>
              </h2>
              <p>Total Reservations</p>
            </div>
            <i class="fas fa-utensils text-4xl"></i>
          </div>
        </div>

        <div class="p-6 bg-gradient-to-r from-[#3b7f68] to-[#58a289] rounded-lg shadow-md text-white transition-transform duration-300 hover:scale-105">
          <div class="flex items-center justify-between">
            <div>
              <h2 class="text-4xl font-bold">
              ₱87,561
              </h2>
              <p>Total Revenue</p>
            </div>
            <i class="fas fa-coins text-4xl"></i>
          </div>
        </a>
        </div>

        <div class="p-6 bg-gradient-to-r from-[#3b7f68] to-[#58a289] rounded-lg shadow-md text-white transition-transform duration-300 hover:scale-105">
        <a href="adminOrder.php">
        <div class="flex items-center justify-between">
            <div>
              <h2 class="text-4xl font-bold">
                <?php echo "<p>$totalOrders</strong></p>"; ?>
              </h2>
              <p>Total Orders</p>
            </div>
            <i class="fas fa-shopping-cart text-4xl"></i>
          </div>
        </a>
       </div>

      <div class="p-6 bg-gradient-to-r from-[#3b7f68] to-[#58a289] rounded-lg shadow-md text-white transition-transform duration-300 hover:scale-105">
        <div class="flex items-center justify-between">
          <div>
            <h2 class="text-4xl font-bold">
              <?php echo "<p>$totalCustomersCount</strong></p>"; ?>
            </h2>
            <p>Total Customers</p>
          </div>
          <i class="fas fa-users text-4xl"></i>
        </div>
      </div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-0 mt-6">
      <div class="bg-white rounded-lg shadow-lg p-6 w-full max-w-[95%]">
      <h2 class="text-xl font-semibold mb-2 text-[#356D59]">Orders Summary</h2>
      <p class="text-gray-500 mb-4">Lorem ipsum dolor sit amet, consectetur</p>
      <div class="flex justify-between items-center mb-6">
        <div class="flex space-x-4">
        <button class="text-green-500 border-b-2 border-green-500 pb-1" id="monthly-tab">
          Today
        </button>
        <button class="text-gray-500" id="weekly-tab">
          Weekly
        </button>
        <button class="text-gray-500" id="today-tab">
          Monthly 
        </button>
        </div>
      </div>
      <div class="tab-content" id="monthly-content">
        <div class="flex flex-col items-center mb-6">
        <p class="text-gray-500 text-center mb-4">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
        </p>
        <button class="bg-green-100 text-green-500 hover:text-[#356D59] py-2 px-4 rounded-full transition-transform duration-300 hover:scale-105">
        <a href="adminOrder.php" >See More Details</a>
        </button>
        </div>
        <div class="grid grid-cols-3 gap-4">
        <div class="bg-white border-2 border-gray hover:border-[#356D59] p-4 transition-colors duration-150 rounded-lg p-4 text-center">
          <div class="text-2xl font-semibold">
          <?php echo "<p>$totalPendingOrders</strong></p>";?>
          </div>
          <div class="text-gray-500">
            Pending
          </div>
        </div>
        <div class="bg-white border-2 border-gray hover:border-[#356D59] p-4 transition-colors duration-150 rounded-lg p-4 text-center">
          <div class="text-2xl font-semibold">
          <?php echo "<p>$totalConfirmedOrders</strong></p>";?>
          </div>
          <div class="text-gray-500">
          Confirmed
          </div>
        </div>
        <div class="bg-white border-2 border-gray hover:border-[#356D59] p-4 transition-colors duration-150 rounded-lg p-4 text-center">
          <div class="text-2xl font-semibold">
          <?php echo "<p>$totalCanceledOrders</strong></p>";?>
          </div>
          <div class="text-gray-500">
          Canceled
          </div>
        </div>
        </div>
    </div>
   <div class="tab-content hidden" id="weekly-content">
    <div class="flex flex-col items-center mb-6">
     
     <p class="text-gray-500 text-center mb-4">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
     </p>
     <button class="bg-green-100 text-green-500 hover:text-[#356D59] py-2 px-4 rounded-full transition-transform duration-300 hover:scale-105">
      More Details
     </button>
    </div>
    <div class="grid grid-cols-3 gap-4">
     <div class="bg-white border-2 border-gray hover:border-[#356D59] p-4 transition-colors duration-150 rounded-lg p-4 text-center">
      <div class="text-2xl font-semibold">
       15
      </div>
      <div class="text-gray-500">
      Pending
      </div>
     </div>
     <div class="bg-white border-2 border-gray hover:border-[#356D59] p-4 transition-colors duration-150 rounded-lg p-4 text-center">
      <div class="text-2xl font-semibold">
       45
      </div>
      <div class="text-gray-500">
      Successful
      </div>
     </div>
     <div class="bg-white border-2 border-gray hover:border-[#356D59] p-4 transition-colors duration-150 rounded-lg p-4 text-center">
      <div class="text-2xl font-semibold">
       5
      </div>
      <div class="text-gray-500">
       Canceled
      </div>
     </div>
    </div>
   </div>
   <div class="tab-content hidden" id="today-content">
    <div class="flex flex-col items-center mb-6">
     
     <p class="text-gray-500 text-center mb-4">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
     </p>
     <button class="bg-green-100 text-green-500 hover:text-[#356D59] py-2 px-4 rounded-full transition-transform duration-300 hover:scale-105">
      More Details
     </button>
    </div>
    <div class="grid grid-cols-3 gap-4">
     <div class="bg-white border-2 border-gray hover:border-[#356D59] p-4 transition-colors duration-150 rounded-lg p-4 text-center">
      <div class="text-2xl font-semibold">
       5
      </div>
      <div class="text-gray-500">
       Pending
      </div>
     </div>
     <div class="bg-white border-2 border-gray hover:border-[#356D59] p-4 transition-colors duration-150rounded-lg p-4 text-center">
      <div class="text-2xl font-semibold">
       20
      </div>
      <div class="text-gray-500">
       Successful
      </div>
     </div>
     <div class="bg-white border-2 border-gray hover:border-[#356D59] p-4 transition-colors duration-150 rounded-lg p-4 text-center">
      <div class="text-2xl font-semibold">
       2
      </div>
      <div class="text-gray-500">
       Canceled
      </div>
     </div>
    </div>
   </div>
  </div>
  <div class="bg-white rounded-lg shadow-lg p-6 w-[100%]">
   <h2 class="text-xl font-semibold mb-2 text-[#356D59]">
    Recent Activity
   </h2>
   <p class="text-gray-500 mb-4">
    Lorem ipsum dolor sit amet, consectetur
   </p>
   <div class="flex justify-between items-center mb-6">
    <div class="flex space-x-4">
                <button id="allStatusBtn" class="bg-green-100 text-green-600 px-4 py-2 rounded-full flex items-center transition-transform duration-300 hover:scale-105">
                    <i class="fas fa-filter mr-2"></i> All Status
                </button>
                <button id="todayBtn" class="bg-green-100 text-green-600 px-4 py-2 rounded-full transition-transform duration-300 hover:scale-105">Today</button>
            </div>
        </div>
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white">
                <thead>
                    <tr class="w-full bg-gray-100 text-gray-600 uppercase text-sm leading-normal">
                        <th class="py-3 px-6 text-left">Order ID</th>
                        <th class="py-3 px-6 text-left">Date</th>
                        <th class="py-3 px-6 text-left">Customer Name</th>
                        <th class="py-3 px-6 text-left">Location</th>
                        <th class="py-3 px-6 text-left">Amount</th>
                        <th class="py-3 px-6 text-left">Status Order</th>
                        <th class="py-3 px-6 text-left"></th>
                    </tr>
                </thead>
                <tbody id="orderTableBody" class="text-gray-600 text-sm font-light">
                    <!-- Rows will be inserted here by JavaScript -->
                </tbody>
            </table>
        </div>
        <div class="flex justify-between items-center mt-4">
            <div id="entriesInfo" class="text-gray-600">Showing 1 to 4 of 11 entries</div>
            <div class="flex space-x-2">
                <button id="prevBtn" class="bg-green-100 text-green-600 px-4 py-2 rounded-full transition-transform duration-300 hover:scale-105transition-transform duration-300 hover:scale-90 hover:text-[#356D59]">Previous</button>
                <button id="nextBtn" class="bg-green-100 text-green-600 px-4 py-2 rounded-full transition-transform duration-300 hover:scale-90 hover:text-[#356D59]">Next</button>
            </div>
        </div>
        <div class="mt-4 text-center">
            <a href="#" class="text-green-600 hover:text-red-600">See More Details</a>
        </div>
    </div>


    
    </main>

    <script src="main.js"></script>
    <script>
       const orders = [
            { id: '#556321', date: '26 March 2020, 12:42 AM', name: 'Olivia Shine', location: '35 Station Road London', amount: '$82.46', status: 'Pending' },
        ];

        let currentPage = 1;
        const rowsPerPage = 1;

        function displayOrders(page) {
            const start = (page - 1) * rowsPerPage;
            const end = start + rowsPerPage;
            const paginatedOrders = orders.slice(start, end);

            const tableBody = document.getElementById('orderTableBody');
            tableBody.innerHTML = '';

            paginatedOrders.forEach(order => {
                const row = document.createElement('tr');
                row.classList.add('border-b', 'border-gray-200', 'hover:bg-green-100');
                row.innerHTML = `
                    <td class="py-3 px-6 text-left">${order.id}</td>
                    <td class="py-3 px-6 text-left">${order.date}</td>
                    <td class="py-3 px-6 text-left">${order.name}</td>
                    <td class="py-3 px-6 text-left">${order.location}</td>
                    <td class="py-3 px-6 text-left">${order.amount}</td>
                    <td class="py-3 px-6 text-left ${order.status === 'Pending' ? 'text-orange-600' : order.status === 'New Order' ? 'text-red-600' : 'text-green-600'}">${order.status}</td>
                    <td class="py-3 px-6 text-left"><i class="fas fa-ellipsis-h"></i></td>
                `;
                tableBody.appendChild(row);
            });

            document.getElementById('entriesInfo').innerText = `Showing ${start + 1} to ${end} of ${orders.length} entries`;
        }

        document.getElementById('prevBtn').addEventListener('click', () => {
            if (currentPage > 1) {
                currentPage--;
                displayOrders(currentPage);
            }
        });

        document.getElementById('nextBtn').addEventListener('click', () => {
            if (currentPage * rowsPerPage < orders.length) {
                currentPage++;
                displayOrders(currentPage);
            }
        });

        // Initial display
        displayOrders(currentPage);

        document.getElementById('monthly-tab').addEventListener('click', function() {
            document.getElementById('monthly-content').classList.remove('hidden');
            document.getElementById('weekly-content').classList.add('hidden');
            document.getElementById('today-content').classList.add('hidden');
            this.classList.add('text-green-500', 'border-b-2', 'border-[#356D59]');
            document.getElementById('weekly-tab').classList.remove('text-green-500', 'border-b-2', 'border-[#356D59]');
            document.getElementById('today-tab').classList.remove('text-green-500', 'border-b-2', 'border-[#356D59]');
        });

        document.getElementById('weekly-tab').addEventListener('click', function() {
            document.getElementById('monthly-content').classList.add('hidden');
            document.getElementById('weekly-content').classList.remove('hidden');
            document.getElementById('today-content').classList.add('hidden');
            this.classList.add('text-green-500', 'border-b-2', 'border-[#356D59]');
            document.getElementById('monthly-tab').classList.remove('text-green-500', 'border-b-2', 'border-[#356D59]');
            document.getElementById('today-tab').classList.remove('text-green-500', 'border-b-2', 'border-[#356D59]');
        });

        document.getElementById('today-tab').addEventListener('click', function() {
            document.getElementById('monthly-content').classList.add('hidden');
            document.getElementById('weekly-content').classList.add('hidden');
            document.getElementById('today-content').classList.remove('hidden');
            this.classList.add('text-green-500', 'border-b-2', 'border-[#356D59]');
            document.getElementById('monthly-tab').classList.remove('text-green-500', 'border-b-2', 'border-[#356D59]');
            document.getElementById('weekly-tab').classList.remove('text-green-500', 'border-b-2', 'border-[#356D59]');
        });
    </script>
  </body>
</html>
