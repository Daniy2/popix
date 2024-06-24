document.addEventListener('DOMContentLoaded', function() {
    var form = document.getElementById('form-reg');

    form.addEventListener('submit', function(event) {
        event.preventDefault();
        if (validateForm()) {
            emailExists();
        }
    });

    function validateUser() {
        const userinput = document.getElementById("username").value;
        if (!userinput) {
            Swal.fire({
                icon: 'error',
                title: 'Errore',
                text: 'Il nome utente non può essere vuoto',
                confirmButtonText: 'Ok'
            });
            return false;
        } else {
            return true;
        }
    }

    function validateEmailInput() {
        const emailInput = document.getElementById('mail').value;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailRegex.test(emailInput)) {
            Swal.fire({
                icon: 'error',
                title: 'Errore',
                text: 'Inserisci un\'email valida prima di inviare il modulo.',
                confirmButtonText: 'Ok'
            });
            return false;
        } else {
            return true;
        }
    }

    function validatePasswordInput() {
        const passwordInput = document.getElementById('password').value;
        const regex =
            /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@.#$!%*?&])[A-Za-z\d!@.#$!%*?&]{8,15}$/;

        if (!regex.test(passwordInput)) {
            Swal.fire({
                icon: 'error',
                title: 'Errore',
                text: 'La password deve essere lunga almeno 8 caratteri e contenere almeno una lettera maiuscola, una lettera minuscola, un numero e un carattere speciale.',
                confirmButtonText: 'Ok'
            });
            return false;
        } else {
            return true;
        }
    }

    function validatePasswordConfirm() {
        const passwordInput = document.getElementById('password').value;
        const repeatPasswordInput = document.getElementById('repeatPassword').value;

        if (passwordInput !== repeatPasswordInput) {
            Swal.fire({
                icon: 'error',
                title: 'Errore',
                text: 'Le password non corrispondono.',
                confirmButtonText: 'Ok'
            });
            return false;
        } else {
            return true;
        }
    }

    function validateForm() {
        return validateUser() && validateEmailInput() && validatePasswordInput() && validatePasswordConfirm();
    }

    function emailExists() {
        let emailInput = document.getElementById('mail').value;
        let xhr = new XMLHttpRequest();
        var url = contextPath + '/signUp';
        xhr.open('POST', url, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                let response = xhr.responseText;
                if (response === "Email già registrata.") {
                    Swal.fire({
                        icon: 'error',
                        title: 'Errore',
                        text: 'Email già esistente',
                        confirmButtonText: 'Ok'
                    });
                } else if (response === "Registrazione completata.") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Successo',
                        text: 'Registrazione effettuata correttamente',
                        confirmButtonText: 'Ok'
                    });
                    form.reset(); // Resetta il modulo dopo la registrazione
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Errore',
                        text: 'Errore durante la registrazione',
                        confirmButtonText: 'Ok'
                    });
                }
            }
        };
        xhr.send('mail=' + encodeURIComponent(emailInput) +
            '&username=' + encodeURIComponent(document.getElementById('username').value) +
            '&password=' + encodeURIComponent(document.getElementById('password').value));
    }
});
