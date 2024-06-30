document.addEventListener('DOMContentLoaded', function() {
    var viewOrdersBtn = document.getElementById('viewOrdersBtn');
    if (viewOrdersBtn) {
        viewOrdersBtn.addEventListener('click', function() {
            // Ottieni il contesto dell'applicazione (contextPath)
            // Costruisci l'URL della servlet desiderata
            var url = contextPath + "/getOrdersServlet";

            // Reindirizza l'utente alla pagina della servlet
            window.location.href = url;
        });
    } else {
        console.error('Elemento con ID viewOrdersBtn non trovato.');
    }
});
