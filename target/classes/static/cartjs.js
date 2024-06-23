const REMOTE_URL = 'http://localhost:8080';

document.addEventListener('DOMContentLoaded', () => {
    console.log("測試 - DOMContentLoaded");

    fetchAndRenderData('/products/list', 'shop-items', renderProduct);

    document.querySelector('.shop-items').addEventListener('click', (event) => {
        console.log("測試 - shop-items click event");
        if (event.target.classList.contains('shop-item-button')) {
            const button = event.target;
            const productId = button.getAttribute('data-id');
            const productName = button.getAttribute('data-name');
            const productPrice = button.getAttribute('data-price');
            const productImage = button.getAttribute('data-image');
            console.log("測試 - product details", { productId, productName, productPrice, productImage });
            handleAddToCart(productId, productName, productPrice, productImage);
        }
    });

    document.querySelector('.btn-purchase').addEventListener('click', async () => {
        console.log("測試 - btn-purchase click event");
        const customerId = 1; // 假設顧客ID為1，需要根據實際情況設置
        const response = await fetch(`${REMOTE_URL}/cart/checkout`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ customerId })
        });

        if (response.ok) {
            console.log("測試 - purchase success response");
            alert('感謝您的購買');
            const cartItems = document.querySelector('.cart-items');
            while (cartItems.hasChildNodes()) {
                cartItems.removeChild(cartItems.firstChild);
            }
            updateCartTotal();
        } else {
            console.log("測試 - purchase error response");
            alert('購買失敗');
        }
    });
});

const fetchAndRenderData = async (url, containerId, renderFn) => {
    console.log(`測試 - Fetching data from ${url}`);
    url = REMOTE_URL + url;
    try {
        const response = await fetch(url);
        if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);

        const data = await response.json();
        console.log(`測試 - Data fetched from ${url}`, data);
        document.getElementById(containerId).innerHTML = Array.isArray(data) ? data.map(renderFn).join('') : renderFn(data);
    } catch (error) {
        console.error(`Error fetching data from ${url}:`, error);
        document.getElementById(containerId).innerHTML = `<tr><td colspan="6">沒有權限讀取</td></tr>`;
    }
};

const renderProduct = ({ productId, name, category, price, imageUrl }) => `
    <div class="shop-item">
        <span class="shop-item-title">${name}</span>
        <img class="shop-item-image" src="${imageUrl}">
        <div class="shop-item-details">
            <span class="shop-item-price">$${price}</span>
            <input class="shop-item-quantity" type="number" value="1" min="1">
            <button class="btn btn-primary shop-item-button" type="button" data-id="${productId}" data-name="${name}" data-price="${price}" data-image="${imageUrl}">加入購物車</button>
        </div>
    </div>`;

const handleAddToCart = async (productId, productName, productPrice, productImage) => {
    const quantity = document.querySelector(`button[data-id="${productId}"]`).parentElement.querySelector('.shop-item-quantity').value;
    const total = productPrice * quantity;
    const customerId = 1; // 假設顧客ID為1，需要根據實際情況設置

    console.log("測試 - Add to cart request payload:", { customerId, productId, price: productPrice, quantity, totalPrice: total });

    try {
        const response = await fetch(`${REMOTE_URL}/cart/add`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ customerId, productId, price: productPrice, quantity, totalPrice: total })
        });

        if (response.ok) {
            console.log("測試 - Add to cart success response:", await response.json());
            const cartItemsContainer = document.querySelector('.cart-items');
            const existingCartItem = Array.from(cartItemsContainer.children).find(
                item => item.querySelector('.cart-item-title').textContent === productName
            );

            if (existingCartItem) {
                const quantityInput = existingCartItem.querySelector('.cart-quantity-input');
                quantityInput.value = parseInt(quantityInput.value) + parseInt(quantity);
            } else {
                const cartRow = document.createElement('div');
                cartRow.classList.add('cart-row');
                cartRow.innerHTML = `
                    <div class="cart-item cart-column">
                        <img class="cart-item-image" src="${productImage}" width="100" height="100">
                        <span class="cart-item-title">${productName}</span>
                    </div>
                    <span class="cart-price cart-column">$${productPrice}</span>
                    <div class="cart-quantity cart-column">
                        <input class="cart-quantity-input" type="number" value="${quantity}" min="1">
                        <button class="btn btn-danger" type="button">移除</button>
                    </div>`;
                cartItemsContainer.append(cartRow);

                cartRow.querySelector('.btn-danger').addEventListener('click', removeCartItem);
                cartRow.querySelector('.cart-quantity-input').addEventListener('change', quantityChanged);
            }

            updateCartTotal();
        } else {
            console.error("測試 - Add to cart error response:", await response.json());
        }
    } catch (error) {
        console.error("測試 - Error adding to cart:", error);
    }
};

const removeCartItem = async (event) => {
    const buttonClicked = event.target;
    const cartRow = buttonClicked.closest('.cart-row');
    const productId = cartRow.querySelector('.cart-item-title').getAttribute('data-id');
    const customerId = 1; // 假設顧客ID為1，需要根據實際情況設置

    console.log("測試 - Remove from cart request payload:", { customerId, productId });

    try {
        await fetch(`${REMOTE_URL}/cart/remove`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ customerId, productId })
        });

        buttonClicked.closest('.cart-row').remove();
        updateCartTotal();
    } catch (error) {
        console.error("測試 - Error removing from cart:", error);
    }
};

const quantityChanged = (event) => {
    const input = event.target;
    console.log("測試 - Quantity changed:", input.value);
    if (isNaN(input.value) || input.value <= 0) {
        input.value = 1;
    }
    updateCartTotal();
};

const updateCartTotal = () => {
    console.log("測試 - Updating cart total");
    const cartItemContainer = document.querySelector('.cart-items');
    const cartRows = cartItemContainer.getElementsByClassName('cart-row');
    let total = 0;

    for (const cartRow of cartRows) {
        const priceElement = cartRow.getElementsByClassName('cart-price')[0];
        const quantityElement = cartRow.getElementsByClassName('cart-quantity-input')[0];
        const price = parseFloat(priceElement.innerText.replace('$', ''));
        const quantity = quantityElement.value;
        total += price * quantity;
    }

    total = Math.round(total * 100) / 100;
    console.log("測試 - Cart total:", total);
    document.querySelector('.cart-total-price').innerText = `$${total}`;
};
