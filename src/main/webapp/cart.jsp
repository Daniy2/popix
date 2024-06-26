
<%@ page contentType="text/html;charset=UTF-8" language="java" %><html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo-noborderico.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style-cart.css">
    <script src="https://kit.fontawesome.com/892069e9ac.js" crossorigin="anonymous"></script>
    <title>Carrello</title>
</head>
<body>

<%@include file="fragments/header.jsp"%>

<main>
    <div class="container">
        <section class="cart">
            <h2>Il tuo carrello</h2>
            <div class="cart-items">
                <div class="cart-item">
                    <img src="#" alt="Product Image">
                    <div class="item-details">
                        <h3>Product Name</h3>
                        <p>ID ######</p>
                        <p>Prezzo: $99.99</p>
                        <div class="quantity">
                            <button>-</button>
                            <span>1</span>        <!--needs script-->
                            <button>+</button>
                        </div>
                    </div>
                    <button class="remove-item"><i class="fas fa-trash-alt"></i></button>
                </div>

                <!-- Example of another cart item -->
                <div class="cart-item">
                    <img src="#" alt="Product Image">
                    <div class="item-details">
                        <h3>Another Product</h3>
                        <p>ID ######</p>
                        <p>Prezzo: $49.99</p>
                        <div class="quantity">
                            <button>-</button>
                            <span>1</span>
                            <button>+</button>
                        </div>
                    </div>
                    <button class="remove-item"><i class="fas fa-trash-alt"></i></button>
                </div>
            </div>

            <div class="shipping">
                <form>
                    <label for="shipping-method">Choose Shipping:</label>
                    <select id="shipping-method" name="shipping-method">
                        <option value="standard">Standard Delivery - &euro;5.00</option>
                        <option value="premium">Premium Delivery - &euro;10.00</option>
                    </select>
                </form>
            </div>

            <div class="cart-summary">
                <h3>Riepilogo</h3>
                <div class="summary-details">
                    <p>Subtotale: #</p>
                    <p>Iva: #</p>
                    <p>Totale: #</p>
                </div>
                <button class="checkout-btn">CHECKOUT</button>
            </div>
        </section>
    </div>
</main>

<%@include file="fragments/footer.jsp"%>

</body>
</html>
