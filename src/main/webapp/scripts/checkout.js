document.addEventListener('DOMContentLoaded', function() {
    var checkout = document.getElementById('checkout');
    if (checkout) {
        checkout.addEventListener('click', function() {
            var subtotal = document.getElementById("sum").textContent.split(": ")[1];
            var url = contextPath + '/checkoutServlet?sum=' + subtotal;
            window.location.href = url;
        });
    }
});
function log_required(){
    Swal.fire({
        icon: 'error',
        title: 'Errore',
        text: 'Devi loggarti per fare il checkout',
        confirmButtonText: 'Ok'
    });
}