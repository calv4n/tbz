<?php
if(isset($_POST['name'], $_POST['size'], $_POST['product'], $_POST['email'])) {
    // Empfänger-Email-Adresse hier eingeben
    $empfaenger = "calvin.pfrender@gmail.com";

    // Betreffzeile hier eingeben
    $betreff = "Produktkauf-Anfrage von " . $_POST['name'];

    // Email-Text hier erstellen
    $nachricht = "Name: " . $_POST['name'] . "\n";
    $nachricht .= "Größe: " . $_POST['size'] . "\n";
    $nachricht .= "Produkt: " . $_POST['product'] . "\n";

    // Email senden
    $headers = 'From: ' . $_POST['email'] . "\r\n" .
               'Reply-To: ' . $_POST['email'] . "\r\n" .
               'X-Mailer: PHP/' . phpversion();
    if(mail($empfaenger, $betreff, $nachricht, $headers)) {
        // Erfolgsmeldung anzeigen
        echo "<p>Vielen Dank für Ihre Anfrage!</p>";
    } else {
        // Fehlermeldung anzeigen
        echo "<p>Es ist ein Fehler aufgetreten. Bitte versuchen Sie es später noch einmal.</p>";
    }
} else {
    // Fehlermeldung anzeigen
    echo "<p>Es ist ein Fehler aufgetreten. Bitte füllen Sie das Formular vollständig aus.</p>";
}

?>