## Simplex/Unidirektional, Half-Duplex/Bidirektional, Duplex/Bidirektional ##

Wie funktioniert das heutige LAN? Begründen sie!

Das heutige LAN basiert auf Duplex-Kommunikation, bei der Daten in beide Richtungen übertragen werden können. 

Es gibt zwei Arten der Duplex-Kommunikation: Vollduplex und Halbduplex. 

Vollduplex ermöglicht die gleichzeitige Übertragung in beide Richtungen, während der Halbduplexmodus zwischen Senden und Empfangen wechselt. Vollduplex wird häufig in modernen LANs verwendet, da es eine effizientere und schnellere Kommunikation ermöglicht.


## Netzwerktopologien ##

1 = Bus

2 = Stern

3 = Ring

4 = Baum

5 = Mesh

Unter Netzwerktopologie versteht man die physische oder logische Anordnung von Knoten (Geräten) in einem Netzwerk. Hier sind ihre Unterschiede, Vor- und Nachteile:

#### Bus-Topologie: ####

Alle Geräte sind über einen gemeinsamen Übertragungsmedium verbunden, das wie ein Bus aussieht.

- ##### Vorteile:
Einfache Installation und Wartung.
Geringe Kosten, da weniger Kabel benötigt werden.

- ##### Nachteile:
Single Point of Failure: Wenn das Buskabel unterbrochen wird, kann das gesamte Netzwerk betroffen sein.

Begrenzte Skalierbarkeit, da die Leistung mit zunehmender Anzahl von Geräten abnimmt.

#### Ring-Topologie: ####

Die Geräte sind zu einem geschlossenen Ring verbunden, bei dem jedes Gerät mit genau zwei anderen Geräten verbunden ist.

- ##### Vorteile:
Gleichberechtigte Kommunikation: Jedes Gerät hat gleiche Zugriffsrechte auf das Übertragungsmedium.
Einfache Implementierung und Fehlertoleranz.

- ##### Nachteile:
Single Point of Failure: Wenn ein Gerät ausfällt, kann das gesamte Netzwerk beeinträchtigt werden.
Schwierigkeiten bei der Identifizierung und Behebung von Fehlern in der Ringstruktur.

#### Stern-Topologie: ###

Alle Geräte sind mit einem zentralen Knotenpunkt (Switch oder Hub) verbunden.

- ##### Vorteile: 
Einfache Verbindung und Erweiterung von Geräten.
Ausfallsicherheit: Der Ausfall eines Geräts beeinträchtigt nicht das gesamte Netzwerk.

- ##### Nachteile:
Single Point of Failure: Der zentrale Knotenpunkt ist kritisch. Wenn er ausfällt, kann das gesamte Netzwerk betroffen sein.
Höhere Kosten durch den Einsatz zusätzlicher Kabel und Knotenpunktgeräte.

#### Baum-Topologie: ####

Hierarchische Struktur, bei der die Geräte wie ein Baum angeordnet sind, mit einem zentralen Knotenpunkt und untergeordneten Knotenpunkten.

- ##### Vorteile: 
Skalierbarkeit: Das Netzwerk kann einfach erweitert werden, indem weitere Knotenpunkte hinzugefügt werden.
Ausfallsicherheit: Ein Ausfall in einem Teil des Netzwerks beeinträchtigt nicht das gesamte Netzwerk.

- ##### Nachteile:
Single Point of Failure: Der zentrale Knotenpunkt ist kritisch.
Komplexität: Die Implementierung und Verwaltung einer Baum-Topologie erfordert mehr Aufwand.

#### Mesh-Topologie: ####

Jedes Gerät ist mit jedem anderen Gerät direkt verbunden.

- ##### Vorteile:
Zuverlässigkeit: Ein Ausfall eines Geräts beeinträchtigt nicht die Kommunikation zwischen anderen Geräten.
Mehrere Kommunikationspfade ermöglichen hohe Datenübertragungsgeschwindigkeiten.

- ##### Nachteile:
Hoher Kabelbedarf und komplexe Verkabel


## Draht, Litze und Glas

Was sind die Vor- und Nachteile der drei unterschiedlichen Fabrikate?
Wo finden sie in der Netzwerktechnik Verwendung? Stichwort: Statische, fixe vs.
dynamische, veränderbare Installation/Verkabelung, Verarbeitung.


Draht, Litze und Glasfaser sind drei Materialien, die in der Netzwerktechnik zur Herstellung von Kabeln verwendet werden. Draht ist kostengünstig und einfach zu verarbeiten, hat aber eine begrenzte Reichweite und ist anfällig für Störungen. Litzen sind flexibler und widerstandsfähiger, aber teurer und schwieriger zu verarbeiten. Glasfaserkabel bieten eine hohe Reichweite und Bandbreite, sind jedoch teurer und erfordern spezielle Installations- und Verarbeitungstechniken. Draht und Litze werden häufig für statische Installationen verwendet, während Glasfaserkabel für dynamische, veränderliche Installationen verwendet werden, da sie an sich ändernde Anforderungen angepasst werden können.

## Störeinflüsse abwehren

- Was kann die Kommunikation stören?
Elektromagnetische Interferenzen (EMI) - Elektromagnetische Wellen, die durch elektrische Geräte, Motoren und andere Quellen erzeugt werden können.

Radiofrequenzinterferenzen (RFI) - Funkwellen, die durch Radiosender, Mobiltelefone und andere Geräte erzeugt werden können.

Kabelübersprechen - Wenn sich Signale von einem Kabel auf ein anderes übertragen.

Signalreflexion - Wenn Signale an Hindernissen reflektiert werden und zu einer falschen Signalinterpretation führen können.

Jitter - Kleine zeitliche Schwankungen im Signal, die durch die Verzögerung und Verarbeitung des Signals entstehen können.

- Und was kann dagegen helfen?
Um diese Störfaktoren abzuwehren, können verschiedene Techniken wie Abschirmung von Kabeln, Verwendung von Filtern, Entstörkondensatoren oder auch Frequenzweichen eingesetzt werden. Darüber hinaus können auch räumliche Trennungen zwischen den Kabeln und anderen Geräten helfen, um Störungen zu minimieren.

## Kabel-Abschirmung

1 = U/TP


2 = S/TP

3 = S/TP

4 = SF/TP

5 = SF/TP

6 = F/TP

7 = S/TP

8 = S/TP

## Ethernet-Medientypen

- #### 100Base-TX

Material: Kupferverbindung
Verbindungsart: Stern/Duplex
IEEE-Norm: 802.3u (Jahr 1995)
Datendurchsatz Brutto: 100Mb/s (Megabit)
Kabelbelegung: 2x100Ω Aderpaare
Kabelkategorie mindestens: CAT5
Segmentlänge max.: 100m

- #### 10Base-T

Material: Kupferverbindung
Verbindungsart: Stern/Halbduplex
IEEE-Norm: 802.3i (Jahr 1990)
Datendurchsatz Brutto: 10Mb/s (Megabit)
Kabelbelegung: 2x100Ω Aderpaare
Kabelkategorie mindestens: CAT3
Segmentlänge max.: 100m

- #### 10Base2

Material: Koaxialkabel
Verbindungsart: Bus/Halbduplex
IEEE-Norm: 802.3 (Jahr 1985)
Datendurchsatz Brutto: 10Mb/s (Megabit)
Kabelbelegung: 50Ω Koaxialkabel
Segmentlänge max.: 185m

- #### 1000Base-LX

Material: Glasfaser/Fibre
Verbindungsart: Stern/Duplex
IEEE-Norm: 802.3z (Jahr 1998)
Datendurchsatz Brutto: 1Gb/s (Gigabit)
Technologie: Long-Wavelength (1310nm)
Segmentlänge max.: 10km

- #### 10GBase-T

Material: Kupferverbindung
Verbindungsart: Stern/Duplex
IEEE-Norm: 802.3an (Jahr 2006)
Datendurchsatz Brutto: 10Gb/s (Gigabit)
Kabelbelegung: 4x100Ω Aderpaare
Kabelkategorie mindestens: CAT6a
Segmentlänge max.: 100m
hat Kontextmenü