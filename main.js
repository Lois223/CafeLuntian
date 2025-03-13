document.addEventListener("DOMContentLoaded", () => {
    const cartSidebar = document.querySelector(".cart-sidebar");
    const cartItemsContainer = document.querySelector(".cart-items");
    const cartIcon = document.querySelector(".cart-icon a");
    const closeCartBtn = document.getElementById("closeCart");
    const cartCount = document.getElementById("cart-count");
    const subtotalElement = document.getElementById("cart-subtotal");
    const checkoutBtn = document.getElementById("checkout-btn");
    const checkoutItemsContainer = document.getElementById("checkout-items");
    const checkoutSubtotal = document.getElementById("checkout-subtotal");

    // retrieve cart data from localStorage / initialize an empty cart
    let cart = JSON.parse(localStorage.getItem("cart")) || [];

    // save cart data to localStorage
    const saveCart = () => {
        cart.length === 0 ? localStorage.removeItem("cart") : localStorage.setItem("cart", JSON.stringify(cart));
    };

     // displaying cart sidebar content 
    const updateCartDisplay = () => {
        if (!cartItemsContainer) return;

        if (cart.length === 0) {
            cartItemsContainer.innerHTML = `<div class="empty-cart"><h2>Your cart is empty</h2></div>`;
            cartCount.textContent = "0";
            subtotalElement.textContent = "₱0.00";
            saveCart();
            return;
        }

        let subtotal = 0;
        cartItemsContainer.innerHTML = cart.map((item, index) => {
            let addonPrice = item.addons === "coffee" ? 10 : item.addons === "alcohol" ? 50 : 0;
            let itemTotal = (item.price + addonPrice) * item.quantity;
            subtotal += itemTotal;

            return `
           <div class="cart-item">
                <div class="cart-main">
                    <img src="${item.image}" alt="${item.name}" width="50">
                    <p>${item.name} (${item.type})</p> 
                    <div class="cart-controls">
                        <button class="qty-btn decrease" data-index="${index}"><i class="fas fa-minus"></i></button>
                        <span>${item.quantity}</span>
                        <button class="qty-btn increase" data-index="${index}"><i class="fas fa-plus"></i></button>
                        <button class="remove-btn" data-index="${index}"><i class="fas fa-trash"></i></button>
                    </div>
                    <p class="total">₱${itemTotal.toFixed(2)}</p>
                </div>
                <div class="add-ons">
                    <p class="addon-title">Add-on Shots:</p>
                    <label>
                        <input type="radio" name="addon-${index}" class="addon-radio" data-index="${index}" value="coffee" ${item.addons === "coffee" ? "checked" : ""}> Coffee
                    </label>
                    <label>
                        <input type="radio" name="addon-${index}" class="addon-radio" data-index="${index}" value="alcohol" ${item.addons === "alcohol" ? "checked" : ""}> Alcohol
                    </label>
                    <label>
                        <input type="radio" name="addon-${index}" class="addon-radio" data-index="${index}" value="none" ${!item.addons ? "checked" : ""}> None
                    </label>
                </div>
            </div>`;
        }).join("");

        cartCount.textContent = cart.reduce((total, item) => total + item.quantity, 0);
        subtotalElement.textContent = `₱${subtotal.toFixed(2)}`;
        saveCart(); // save cart after update
    };

    // adding item to cart
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
                cart.push({ name, type, price, quantity: 1, image, addons: null });
            }

            updateCartDisplay();
        });
    });

    // handle add-on selections 
    cartItemsContainer?.addEventListener("change", (e) => {
        const index = e.target.dataset.index;
        if (index === undefined) return;

        if (e.target.classList.contains("addon-radio")) {
            cart[index].addons = e.target.value === "none" ? null : e.target.value;
        }

        updateCartDisplay();
    });

    // cart btns action (increase, decrease, remove)
    cartItemsContainer?.addEventListener("click", (e) => {
        const index = e.target.closest("button")?.dataset.index;
        if (index === undefined) return;

        if (e.target.closest(".increase")) {
            cart[index].quantity++;
        } else if (e.target.closest(".decrease")) {
            if (cart[index].quantity > 1) {
                cart[index].quantity--;
            } else {
                cart.splice(index, 1);
            }
        } else if (e.target.closest(".remove-btn")) {
            cart.splice(index, 1);
        }

        updateCartDisplay();
    });

   // toggle cart sidebar visibility
   if (cartIcon) {
        cartIcon.addEventListener("click", (e) => {
            e.preventDefault();
            cartSidebar.classList.toggle("active");
            updateCartDisplay();
        });
    }

    // close cart sidebar 
    if (closeCartBtn) {
        closeCartBtn.addEventListener("click", () => cartSidebar.classList.remove("active"));
    }

    // redirect to checkout page
    if (checkoutBtn) {
        checkoutBtn.addEventListener("click", () => {
            localStorage.setItem("cart", JSON.stringify(cart));
            window.location.href = "checkout.php";
        });
    }

     // display cart items on checkout page
const displayCheckoutItems = () => {
    if (!checkoutItemsContainer || !checkoutSubtotal) return;

    let checkoutCart = JSON.parse(localStorage.getItem("cart")) || [];

    if (checkoutCart.length === 0) {
        checkoutItemsContainer.innerHTML = `<div class="empty-cart"><h3>Your cart is empty</h3></div>`;
        checkoutSubtotal.textContent = "₱0.00";
        return;
    }

    let subtotal = 0;
    let orderName = checkoutCart.map(item => item.name).join(", ");
    let quantity = 0;

    checkoutItemsContainer.innerHTML = checkoutCart.map(item => {
        let addonPrice = item.addons === "coffee" ? 10 : item.addons === "alcohol" ? 50 : 0;
        let itemTotal = (item.price + addonPrice) * item.quantity;
        subtotal += itemTotal;
        quantity += item.quantity;

        return `
            <div class="checkout-item">
                <img src="${item.image}" alt="${item.name}" width="50">
                <div class="checkout-details">
                    <p><strong>${item.name}</strong> (${item.type})</p>
                    <p>Quantity: ${item.quantity}</p>
                    <p>Add-on: ${item.addons ? item.addons.charAt(0).toUpperCase() + item.addons.slice(1) : "None"}</p>
                    <p class="total">₱${itemTotal.toFixed(2)}</p>
                </div>
            </div>`;
    }).join("");

    // Update the checkout form hidden fields
    document.getElementById("Order_Name").value = orderName; // Populate with product names
    document.getElementById("Price").value = subtotal.toFixed(2); // Populate with total price
    document.getElementById("Quantity").value = quantity; // Populate with total quantity

    localStorage.setItem("subtotal", subtotal.toFixed(2));
    checkoutSubtotal.textContent = `₱${subtotal.toFixed(2)}`;
};

// if on checkout page, display items
if (checkoutItemsContainer) {
    displayCheckoutItems();
}

});

