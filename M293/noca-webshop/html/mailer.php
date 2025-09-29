<?php

// E-Mail-Adresse, an die die Formulardaten gesendet werden sollen
$to = "calvin.pfrender@edu.tbz.ch";

// Betreff der E-Mail
$subject = "New Message from " . $_POST["name"];

// Inhalt der E-Mail
$message = "Name: " . $_POST["name"] . "\n\n";
$message .= "E-Mail: " . $_POST["email"] . "\n\n";
$message .= "Messaget:\n" . $_POST["message"];

// Header der E-Mail
$headers = "From: " . $_POST["email"] . "\r\n";
$headers .= "Reply-To: " . $_POST["email"] . "\r\n";

// E-Mail senden
if (mail($to, $subject, $message, $headers)) {
    // Erfolgsmeldung anzeigen
    echo "<h1>Nachricht gesendet</h1>";
    echo "<p>Vielen Dank für Ihre Nachricht.</p>";
} else {
    // Fehlermeldung anzeigen, wenn die E-Mail nicht gesendet werden konnte
    echo "<h1>Fehler beim Senden der Nachricht</h1>";
    echo "<p>Es tut uns leid, aber Ihre Nachricht konnte nicht gesendet werden. Bitte versuchen Sie es später erneut oder wenden Sie sich direkt an uns.</p>";
}

?>
