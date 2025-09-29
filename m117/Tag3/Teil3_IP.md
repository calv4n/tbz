## Der Hostname 

Eindeutige Benennung eines Host's wie z.B. PC, Server, Drucker etc.

Maximale Länge des Hostnamen: In der Regel 255

Erlaubte Zeichen: Großbuchstaben (A-Z), Kleinbuchstaben (a-z), Ziffern (0-9) und das Minuszeichen (-). Es ist aber wichtig zu beachten, dass der Hostname nicht mit einem Minuszeichen (-) oder einer Ziffer beginnen oder enden darf und dass keine Leerzeichen oder Sonderzeichen wie Umlaute verwendet werden dürfen.

Hier in WIN eintragen: Hier ist ein Step by Step 

1. Klicke auf das Startmenü und öffne die Systemsteuerung.
2. Navigiere zu "System und Sicherheit" und wähle dort "System" aus.
3. Klicke auf "Erweiterte Systemeinstellungen" in der linken Seitenleiste.
4. Klicke auf die Schaltfläche "Einstellungen" unter "Computername".
5. Klicke auf die Schaltfläche "Ändern" und gib den gewünschten Hostnamen ein.
6. Klicke auf "OK", um die Änderungen zu speichern.

Man braucht aber vielleicht die Administrationsrechte, um ein paar Schritte zu machen.

##  Die MAC-Adresse

Dies ist die physikalische Adresse oder Hardware-Adresse des Netzwerkadapters, die als
eindeutiger Identifikator des Geräts innnerhalb einem Rechnernetz dient. Ein Gerät kann
übrigens mehrere Netzwerkadapter besitzen.

Die Abkürzung MAC steht für:  "Media Access Control".

Hier in WIN nachsehen: Hier ist ein Step by Step

1. Öffne das Startmenü und suche nach "Eingabeaufforderung". Klicke auf das Suchergebnis, um die Eingabeaufforderung zu öffnen.
2. Gib in der Eingabeaufforderung den Befehl "ipconfig /all" ein und drücke die Eingabetaste.
3. Es werden verschiedene Informationen angezeigt, suche nach dem Eintrag "physical address" oder "MAC address". Es können mehrere MAC-Adressen für verschiedene Netzwerkadapter angezeigt werden, wenn das Gerät über mehrere Adapter verfügt.
4. Die angezeigte MAC-Adresse besteht in der Regel aus sechs Gruppen von je zwei alphanumerischen Zeichen, die durch Doppelpunkte oder Bindestriche getrennt sind.

Man braucht aber vielleicht die Administrationsrechte, um ein paar Schritte zu machen.

Meine MAC Adresse in hexadezimaler Schreibweise: F6-7B-09-8A-D9-6E

In binärer Schreibweise: 11110110-01111011-00001001-10001010-11011001-01101110

In hexadezimaler Schreibweise: F6-7B-09-8A-D9-6E

## Die IPv4-Adresse

Die IP-Adresse ist die logische Adresse. Zurzeit sind zwei IP-Versionen in Gebrauch: IPv4
als 32-Bit-Adresse und sein Nachfolger, IPv6 mit 128-Bit-Adressen. (IPv5 wurde
übersprungen). Im folgenden Text fokussieren wir uns auf IPv4.

Die Abkürzung IP steht für:  "Internet Protocol"

Hier in WIN eintragen/nachsehen: Hier ist ein Step by Step

1. Öffne das Startmenü und suche nach "Eingabeaufforderung". Klicke auf das Suchergebnis, um die Eingabeaufforderung zu öffnen.
2. Gib in der Eingabeaufforderung den Befehl "ipconfig" ein und drücke die Eingabetaste.
3. Es werden verschiedene Informationen angezeigt, suche nach dem Eintrag "IPv4 address". Dort findest du die aktuelle IP-Adresse deines Notebooks.

Achte darauf das die IP-Adresse sich jedes mal beim neustart des Geräts neu generiert.

## Subnetting

Die Internetprotokoll-Version 4 (IPv4) lässt mit ihren 32 Bit die riesige Menge von 2
32 oder
4’294’967'296 IP-Adressen zu. Schon Julius Cäsar erkannte den Nutzen von «Teilen und
Herrschen» (Lat. Divide et impera) und was ihm recht war, ist uns billig: Netze unterteilen.

Erklären sie in ein paar Worten, was uns Subnetting bringt:

Subnetting ermöglicht die Aufteilung eines großen IP-Adressraums in kleinere Netzwerke, was zu einer effizienteren Nutzung der verfügbaren Adressen führt. Es ermöglicht die Segmentierung eines Netzwerks in logische Subnetze, wodurch die Netzwerkleistung, die Sicherheit und die Verwaltung verbessert werden. Subnetting hilft auch bei der effizienten Weiterleitung von Datenpaketen innerhalb des Netzwerks.

## Netzwerkadresse und Broadcastadresse

In einem Subnetz gibt es zwei IP-Adressen, die für den Betrieb reserviert sind und nicht an Hosts verteilt werden dürfen. Dies sind die Netzwerkadresse und die Broadcastadresse.
In einem Subnetz fallen also immer zwei IP-Adressen weg, die nicht genutzt werden können

Definition Netzwerkadresse: Die Netzwerkadresse ist die erste IP-Adresse in einem Subnetz und repräsentiert das Subnetz selbst.

Definition Broadcastadresse: Die Broadcastadresse ist die letzte IP-Adresse in einem Subnetz und wird verwendet, um Datenpakete an alle Hosts im Subnetz zu senden.
