// Variablen für das Formular und die Ausgabe
var form = document.getElementById('mein-formular');
var output = document.getElementById('ausgabe');

// Das Formular bei Absenden überprüfen
form.addEventListener('submit', function(event) {
  event.preventDefault(); // Standard-Formularverhalten unterdrücken

  // Formular-Elemente auslesen
  var name = document.getElementById('name').value;
  var email = document.getElementById('email').value;
  var size = document.getElementById('size').value;
  var product = document.getElementById('product').value;

  // Validierung der Formular-Eingaben
  if (name.trim() === '') {
    output.innerHTML = 'Bitte geben Sie Ihren Namen ein.';
    return false;
  }

  if (email.trim() === '') {
    output.innerHTML = 'Bitte geben Sie Ihre E-Mail-Adresse ein.';
    return false;
  }

  if (!validateEmail(email)) {
    output.innerHTML = 'Bitte geben Sie eine gültige E-Mail-Adresse ein.';
    return false;
  }

  if (size.trim() === '') {
    output.innerHTML = 'Bitte wählen Sie eine Größe aus.';
    return false;
  }

  if (product.trim() === '') {
    output.innerHTML = 'Bitte geben Sie den Produktnamen ein.';
    return false;
  }

  // AJAX-Anfrage zum Senden des Formulars an den PHP-Mailer
  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'mailer.php', true);
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xhr.onload = function() {
    if (xhr.status === 200) {
      output.innerHTML = xhr.responseText;
      form.reset();
    } else {
      output.innerHTML = 'Es ist ein Fehler aufgetreten. Bitte versuchen Sie es später noch einmal.';
    }
  };
  xhr.send('name=' + encodeURIComponent(name) + '&email=' + encodeURIComponent(email) + '&size=' + encodeURIComponent(size) + '&product=' + encodeURIComponent(product));
});

// Funktion zur Validierung von E-Mail-Adressen
function validateEmail(email) {
  var re = /\S+@\S+\.\S+/;
  return re.test(email);
}
