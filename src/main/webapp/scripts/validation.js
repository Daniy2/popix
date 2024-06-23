function validateuser() {
    const userinput = document.getElementById("username").value;
    if(!userinput){
        Swal.fire({
            icon: 'error',
            title: 'Errore',
            text: 'il nome utente non può essere vuoto',
            confirmButtonText: 'Ok'
        });
        return false;
    }else return true;
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

    }else return true;
}

function validatePasswordInput() {
    const passwordInput = document.getElementById('password').value;
    const repeatPasswordInput = document.getElementById('repeatPassword').value;
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

    }else return true;
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
    }else return true;
}

function validateForm(){
    if (!validateuser()|| !validateEmailInput() || !validatePasswordInput() || !validatePasswordConfirm() ) {
        return false;
    }
}