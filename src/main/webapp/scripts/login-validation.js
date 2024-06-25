document.addEventListener('DOMContentLoaded', function() {
    var form = document.getElementById('login-form');
    form.addEventListener('submit', function(event) {
        event.preventDefault(); // Impedisce il comportamento predefinito del form (ricaricamento della pagina)
        checkCredentials(); // Chiamata alla funzione che gestisce l'autenticazione tramite AJAX
    });

    function checkCredentials() {
        var xhr = new XMLHttpRequest();
        var url = contextPath + '/signIn';
        xhr.open('POST', url, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    var response = xhr.responseText;
                    if (response === "Nome utente o password sbagliata.") {
                        Swal.fire({
                            icon: 'error',
                            title: 'Errore',
                            text: 'Nome utente o password sbagliata.',
                            confirmButtonText: 'Ok'
                        });
                    } else {
                        // Opzionale: Puoi fare qualcosa qui se necessario dopo il login
                        if (response === "user") {
                            window.location.href = contextPath + '/home.jsp';
                        } else if (response === "admin") {
                            window.location.href = contextPath + '/admin/admin.jsp';
                        }
                    }
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Errore',
                        text: 'Errore durante la richiesta al server. Codice: ' + xhr.status,
                        confirmButtonText: 'Ok'
                    });
                }
            }
        };
        // Prepara i dati da inviare tramite POST
        xhr.send('&username=' + encodeURIComponent(document.getElementById('username').value) +
            '&password=' + encodeURIComponent(document.getElementById('password').value));
    }
});
