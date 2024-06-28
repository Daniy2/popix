
document.addEventListener('DOMContentLoaded', function() {
    var addToCartButton = document.getElementById('addToCartButton');
    if (addToCartButton) {
        addToCartButton.addEventListener('click', function() {
            var productId = addToCartButton.getAttribute('data-product-id');
            alert(productId);
            var quantity = document.getElementById('quantity').value;

            var url = contextPath + '/addCartServlet?id=' + productId + '&qty=' + quantity;
            window.location.href = url;
        });
    }
});
