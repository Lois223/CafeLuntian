// cart and checkout
document.addEventListener("DOMContentLoaded", () => {
    const cartSidebar = document.querySelector(".cart-sidebar");
    const cartItemsContainer = document.querySelector(".cart-items");
    const cartIcon = document.querySelector(".cart-icon a");
    const closeCartBtn = document.getElementById("closeCart");
    const cartCount = document.getElementById("cart-count");
    const subtotalElement = document.getElementById("cart-subtotal");
    const checkoutBtn = document.getElementById("checkout-btn");

    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    // Function to Save Cart to Local Storage
    const saveCart = () => {
        if (cart.length === 0) {
            localStorage.removeItem("cart"); // Clear storage if cart is empty
        } else {
            localStorage.setItem("cart", JSON.stringify(cart));
        }
    };

    // Function to Update Cart Display
    const updateCartDisplay = () => {
        if (cart.length === 0) {
            cartItemsContainer.innerHTML = `<div class="empty-cart"><h2>Your cart is empty</h2></div>`;
            cartCount.textContent = "0";
            subtotalElement.textContent = "₱0.00";
            saveCart();
            return;
        }

        let subtotal = 0;
        cartItemsContainer.innerHTML = cart.map((item, index) => {
            let itemTotal = item.price * item.quantity;
            subtotal += itemTotal;

            return `
            <div class="cart-item">
                <img src="${item.image}" alt="${item.name}" width="50">
                <p>${item.name} (${item.type})</p> 
                <div class="cart-controls">
                    <button class="qty-btn decrease" data-index="${index}">
                        <i class="fas fa-minus"></i>
                    </button>
                    <span>${item.quantity}</span>
                    <button class="qty-btn increase" data-index="${index}">
                        <i class="fas fa-plus"></i>
                    </button>
                    <button class="remove-btn" data-index="${index}">
                        <i class="fas fa-trash"></i>
                    </button>
                </div>
                <p class="total">₱${itemTotal.toFixed(2)}</p>
            </div>`;
        }).join("");

        cartCount.textContent = cart.reduce((total, item) => total + item.quantity, 0);
        subtotalElement.textContent = `₱${subtotal.toFixed(2)}`;
        saveCart(); // Save cart after update
    };

    // Add Item to Cart
    document.querySelectorAll(".add-btn").forEach(button => {
        button.addEventListener("click", () => {
            const menuItem = button.closest(".menu-item");
            const name = menuItem.dataset.name;
            const type = menuItem.dataset.type;
            const price = parseFloat(menuItem.dataset.price.replace("₱", "").trim());
            const image = menuItem.dataset.image;

            let item = cart.find(i => i.name === name && i.type === type);

            if (item) {
                item.quantity++;
            } else {
                cart.push({ name, type, price, quantity: 1, image });
            }

            updateCartDisplay();
        });
    });

    // Cart Button Actions (Increase, Decrease, Remove)
    cartItemsContainer.addEventListener("click", (e) => {
        const index = e.target.closest("button")?.dataset.index;
        if (index === undefined) return;

        if (e.target.closest(".increase")) {
            cart[index].quantity++;
        } else if (e.target.closest(".decrease")) {
            if (cart[index].quantity > 1) {
                cart[index].quantity--;
            } else {
                cart.splice(index, 1); // 🔥 Remove item from cart properly
            }
        } else if (e.target.closest(".remove-btn")) {
            cart.splice(index, 1); // 🔥 Ensure item is fully removed
        }

        updateCartDisplay();
    });

    // Toggle Cart Sidebar
    cartIcon.addEventListener("click", (e) => {
        e.preventDefault();
        cartSidebar.classList.toggle("active");
        updateCartDisplay();
    });

    // Close Cart Sidebar
    closeCartBtn.addEventListener("click", () => cartSidebar.classList.remove("active"));

    // Checkout Button
    if (checkoutBtn) {
        checkoutBtn.addEventListener("click", () => {
            localStorage.setItem("cart", JSON.stringify(cart)); // Save cart before checkout
            window.location.href = "checkout.php";
        });
    }

    // Checkout Page Logic
    const checkoutItemsContainer = document.querySelector(".checkout-items");
    const checkoutSubtotal = document.getElementById("checkout-subtotal");

    const displayCheckoutItems = () => {
        if (!checkoutItemsContainer || !checkoutSubtotal) return;
    
        // Retrieve the saved cart from localStorage
        let checkoutCart = JSON.parse(localStorage.getItem("cart")) || [];
    
        if (checkoutCart.length === 0) {
            checkoutItemsContainer.innerHTML = `<div class="empty-cart"><h2>Your cart is empty</h2></div>`;
            checkoutSubtotal.textContent = "₱0.00";
            return;
        }
    
        let subtotal = 0;
        checkoutItemsContainer.innerHTML = checkoutCart.map(item => {
            let itemTotal = item.price * item.quantity;
            subtotal += itemTotal;
    
            return `
            <div class="checkout-item">
                <img src="${item.image}" alt="${item.name}" width="50">
                <p>${item.name} (${item.type})</p>
                <p>Quantity: ${item.quantity}</p>
                <p class="total">₱${itemTotal.toFixed(2)}</p>
            </div>`;
        }).join("");
    
        // Ensure subtotal matches cart sidebar subtotal
        localStorage.setItem("subtotal", subtotal.toFixed(2));  // Save subtotal to localStorage
        checkoutSubtotal.textContent = `₱${subtotal.toFixed(2)}`;
    };
    
    // Ensure the subtotal updates on page load
    document.addEventListener("DOMContentLoaded", () => {
        displayCheckoutItems();
    });
    

    // Display Checkout Items on Checkout Page
    displayCheckoutItems();

    // 🔥 Ensure Cart Updates on Page Load
    updateCartDisplay();

});
