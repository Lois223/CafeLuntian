<?php
session_start();
include('mycon.php');

$subtotal = isset($_SESSION['subtotal']) ? $_SESSION['subtotal'] : 0; // Retrieve subtotal from session
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cafe Luntian</title>
    <link rel="icon" type="image/png" sizes="32x32" href="img/logo2.png">
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/1e3d5daa34.js" crossorigin="anonymous"></script>
</head>
<body style="background-color: #f4f4f4;">
    <section class="nav" id="checkout-nav">
        <a href="index.php"><img src="img/logo.png" class="logo"></a>
        <div class="cart-icon">
            <a href="#" id="cart-icon">
                <i class="fa-solid fa-bag-shopping"></i>               
                <span id="cart-count">0</span>
            </a>
        </div>
    </section>

    <section class="checkout">
        <div class="form-side">
            <h2>Checkout</h2>
            <div class="image-side">
                <div class="qr-container">
                    <img src="img/gcash.png" alt="GCash QR Code">
                    <div class="gcash-info">
                        <h2>GCash Account</h2>
                        <p class="gcash-number">09xx xxx xxx</p> 
                    </div>
                </div>
            </div>

            <form>
                <div class="form-group">
                    <input type="text" placeholder="Full Name" name="Full_Name" required>
                </div>
                <div class="form-group">
                    <input type="email" placeholder="Email" name="Email" required>
                </div>
                <div class="form-group">
                    <input type="text" placeholder="Contact Number" name="Contact" required>
                </div>
                <div class="form-group">
                    <label for="receipt">Date Ordered:</label> <br>
                    <input type="date" name="Date" required>
                </div>
                <div class="form-group">
                    <label for="receipt">Time:</label> <br>
                    <input type="time" name="Time" required>
                </div>
                <div class="form-group">
                    <label for="receipt">Upload Your Receipt:</label> <br>
                    <input type="file" name="Receipt" id="receipt" accept="image/*" required>
                </div>
                <button type="submit" class="btn-1" name="Checkout">Complete Purchase</button>
            </form>
        </div>

        <div class="separator"></div>

        <div class="checkout-container">
            <h2>Checkout Summary</h2>
            <div id="checkout-items"></div> 
            <p class="subtotal"><strong>Subtotal:</strong> 
                <span id="checkout-subtotal">₱0.00</span>
            </p>
        </div>
    </section>

    <section class="footer-banner">
        <img src="img/banner.jpg">
        <div class="content">
            <h1>Every cup tells a story.</h1>
            <p>CRAFTED WITH PASSION, BREWED FOR YOU.</p>
        </div>
    </section>
    
    <section class="footer">
        <div class="box-container">
            <div class="box">
                <h3>QUICK LINKS</h3>
                <a href="index.php">Home</a>
                <a href="about.php">About</a>
                <a href="services.php">Services</a> 
                <a href="menu.php">Menu</a> 
                <a href="reservation.php">Reservation</a> 
                <a href="events.php">Events</a> 
            </div>

            <div class="box">
                <h3>GET IN TOUCH</h3>
                <p><i class="fas fa-map-marker-alt"></i>791 President Laurel Highway, Brgy. Darasa, Tanauan</p>
                <p><i class="fas fa-phone-alt"></i>0915 061 6194</p>
                <p><i class="fas fa-envelope"></i>fo.haciendadarasa@gmail.com</p> 
            </div>

            <div class="box">
                <h3>FOLLOW US</h3>
                <p>Stay updated with our latest brews and offers!</p>
                <div class="icons">
                    <a href="#" class="fa-brands fa-square-facebook"></a> 
                </div>  
            </div>

            <div class="box">
                <h3>OPEN HOURS</h3>
                <p><span>Monday - Friday</span></p>
                <p>8:00 AM - 5:00 PM</p>
                <p><span>Saturday - Sunday</span></p>
                <p>8:00 AM - 5:00 PM</p>
            </div>
        </div>

        <div class="credit">©2025 Café Luntian <span> | All rights reserved.</span></div> 
    </section>

    <script src="main.js"></script> 

</body>
</html>