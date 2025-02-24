# Dokumentation Davi und Calvin

### CWE und Zusammenhang mit OWASP Top 10

CWE (Common Weakness Enumeration) ist eine Liste häufiger Softwareschwachstellen, die von der MITRE Corporation verwaltet wird. Sie dient als Referenz zur Klassifikation und Analyse von Sicherheitsproblemen. OWASP Top 10 listet die kritischsten Sicherheitsrisiken auf, wobei jedes OWASP-Problem mehreren CWE-Kategorien zugeordnet ist. Dadurch lassen sich konkrete Schwachstellen besser analysieren und entsprechende Abhilfemassnahmen ableiten.

### Unterschied OWASP Top 10 Risk und OWASP Proactive Control

- **OWASP Top 10 Risk:** Diese Liste beschreibt die häufigsten und kritischsten Sicherheitsrisiken, die in modernen Anwendungen auftreten. Sie dient als Warnung und als Grundlage für Sicherheitsbewertungen.
- **OWASP Proactive Controls:** Dies sind empfohlene Best Practices für Entwickler, um Sicherheitslücken zu verhindern. Statt Sicherheitsprobleme zu klassifizieren, fokussiert sich Proactive Controls darauf, Sicherheitsprinzipien bereits in der Design- und Entwicklungsphase umzusetzen.

## OWASP A04: Insecure Design

### Überblick

OWASP A04: Insecure Design beschreibt Sicherheitsrisiken, die durch unzureichende oder fehlerhafte Sicherheitsarchitektur und -prinzipien entstehen. Dies betrifft nicht nur einzelne Sicherheitslücken in der Implementierung, sondern grundlegende Design-Schwächen, die potenziell schwer zu beheben sind.

### Theoretische Hintergründe und Bedrohung

#### Was ist Insecure Design genau?

Insecure Design beschreibt Schwachstellen, die aus mangelhaftem Sicherheitsdenken in der Planungs- und Entwicklungsphase resultieren. Es unterscheidet sich von Implementierungsfehlern, da es nicht um einzelne Coding-Mängel geht, sondern um konzeptionelle Sicherheitslücken, die oft tief in der Architektur einer Anwendung verwurzelt sind. Eine Anwendung mit einem unsicheren Design kann auch dann angreifbar sein, wenn sie fehlerfrei implementiert wurde.

#### Merkmale von Insecure Design

- **Fehlende Sicherheitsanforderungen:** Sicherheitsmechanismen werden nicht von Anfang an in den Entwicklungsprozess integriert.
- **Mangelnde Bedrohungsmodellierung:** Potenzielle Angriffsvektoren werden nicht ausreichend analysiert und berücksichtigt.
- **Fehlende Sicherheitsprinzipien:** Grundlegende Prinzipien wie "Security by Design", "Least Privilege" oder "Defense in Depth" werden nicht angewendet.
- **Unsichere Standardkonfigurationen:** Systeme und Anwendungen werden mit unsicheren Voreinstellungen ausgeliefert.
- **Fehlende Mechanismen zur Schadensbegrenzung:** Selbst wenn eine Schwachstelle ausgenutzt wird, fehlen Maßnahmen, um die Auswirkungen zu minimieren.

 #### Ursachen von Insecure Design

- **Fehlende Sicherheitsrichtlinien:** Unternehmen oder Entwickler setzen keine klaren Sicherheitsanforderungen und -richtlinien um.
- **Unzureichende Bedrohungsmodellierung:** Mangelhafte Analyse potenzieller Angriffsvektoren während der Designphase.
- **Keine Prinzipien des sicheren Designs:** Keine Berücksichtigung von Sicherheitsprinzipien wie Least Privilege oder Defense in Depth.
- **Fehlende Sicherheitsüberprüfungen:** Sicherheitsaspekte werden nicht in Code-Reviews oder Tests priorisiert.
- **Zu hohe Komplexität:** Übermäßig komplexe Systeme mit schlecht dokumentierten Schnittstellen und Abhängigkeiten begünstigen Designfehler.

#### Mögliche Folgen

- **Unautorisierter Zugriff auf sensible Daten:** Schwachstellen im Design können Angreifern Zugriff auf geschützte Ressourcen gewähren.
- **Umgehung von Sicherheitsmechanismen:** Unzureichend durchdachte Sicherheitsmaßnahmen können leicht ausgehebelt werden.
- **Eskalation von Berechtigungen:** Angreifer könnten aufgrund von Designfehlern höhere Rechte erlangen als vorgesehen.
- **Systemmanipulation:** Schwachstellen ermöglichen Angreifern, Systeme zu manipulieren oder zu übernehmen.

### Schwachstellen im Code (Demo)

#### 1. Fehlende Zugriffskontrolle

**Schwachstelle:** Jeder Benutzer kann auf für die Admins geschützte Ressourcen zugreifen.

```python
@app.route('/admin')
def admin_dashboard():
    return "Willkommen im Admin-Dashboard!"
```

**Massnahme:** Implementierung von einer rollenbasierten Zugriffskontrolle 

```python
from flask import Flask, request, abort
app = Flask(__name__)

users = {"admin": "secret"}

@app.route('/admin')
def admin_dashboard():
    auth = request.authorization
    if not auth or users.get(auth.username) != auth.password:
        abort(403)  # Zugriff verweigern
    return "Willkommen im Admin-Dashboard!"
```

#### 2. Unsichere Sitzungsverwaltung

**Schwachstelle:** Ein Benutzer kann eine Sitzung mit sehbaren Tokens übernehmen.

```python
import random

def generate_token():
    return str(random.randint(1000, 9999))
```

**Massnahme:** Einen hex Token-Generator verwenden.

```python
import secrets

def generate_token():
    return secrets.token_hex(32)
```

#### 3. Fehlende Eingabevalidierung

**Schwachstelle:** SQL-Injektion durch fehlende Eingabevalidierung und direkte SQL Abfragen ohne Validierung.

```python
import sqlite3

def get_user(username):
    conn = sqlite3.connect("database.db")
    cursor = conn.cursor()
    query = f"SELECT * FROM users WHERE username = '{username}'"
    cursor.execute(query)
    return cursor.fetchall()
```

**Massnahme:** Nutzung von vorbereiteter SQL-Statements zur Vermeidung von Injektions-Angriffen

```python
import sqlite3

def get_user(username):
    conn = sqlite3.connect("database.db")
    cursor = conn.cursor()
    query = "SELECT * FROM users WHERE username = ?"
    cursor.execute(query, (username,))
    return cursor.fetchall()
```

### Fazit und Erkenntnisse

- Ich habe erkannt, dass grundlegende Sicherheitsprobleme, oft schwer zu beheben oder zu finden sind, wenn sie nicht früh in der Entwicklung erwähnt werden. Deswegen ist es wichtig Sicherheitskonzepte, wie Bedrohungsmodellierung, Zugriffskontrollen, oder die Validierung von Eingaben von Beginn an zu integrieren.


## OWASP A05: Security Misconfiguration

### 1. Einleitung

Security Misconfiguration ist eine der häufigsten Sicherheitslücken, die in modernen Webanwendungen und IT-Infrastrukturen auftreten. Sie beschreibt Fehler oder unzureichende Einstellungen in der Konfiguration von Systemen, Software oder Netzwerken, die die Sicherheit gefährden. Diese Art der Schwachstelle kann auf allen Ebenen der Technologie auftreten, von der Infrastruktur über die Anwendung bis hin zu den Benutzereinstellungen.

### 2. Theoretische Hintergründe

Security Misconfiguration tritt auf, wenn Systeme und Anwendungen in einem unsicheren Zustand betrieben werden, der nicht den besten Sicherheitspraktiken entspricht. Dies kann durch Standard-Konfigurationen, unzureichend konfigurierte Firewalls oder falsche Rechtevergabe passieren. Einige der häufigsten Ursachen für Sicherheitsfehler sind:

- **Verwendung von Standardkennwörtern und Standardkonfigurationen:** Viele Anwendungen oder Server werden mit voreingestellten Standardwerten ausgeliefert, die potenziell leicht zu erraten sind.
- **Fehlende regelmässige Updates:** Systeme, die nicht regelmässig gepatcht oder aktualisiert werden, sind anfällig für bekannte Sicherheitslücken.
- **Fehlende oder inkorrekte Zugriffskontrollen:** Wenn Zugriffsrechte nicht richtig konfiguriert sind, können unberechtigte Benutzer auf sensible Daten zugreifen.
- **Unsichere Default-Einstellungen:** Beispielsweise werden einige Softwareprodukte mit unsicheren Standardeinstellungen ausgeliefert, die dann nicht nachträglich angepasst werden.

### 3. Bedrohungen durch Security Misconfiguration

Die Folgen einer fehlerhaften Konfiguration können schwerwiegende Sicherheitslücken öffnen, durch die Angreifer Zugriff auf Daten oder Systeme erhalten. Zu den typischen Bedrohungen gehören:

- **Unberechtigter Zugriff:** Angreifer können durch unsichere Konfigurationen unbefugten Zugriff auf Datenbanken oder Server erhalten.
- **Datenverlust oder -diebstahl:** Wenn sensible Daten wie Passwörter, persönliche Informationen oder Finanzdaten nicht ausreichend geschützt sind, können sie gestohlen oder manipuliert werden.
- **Denial of Service (DoS):** Eine unsichere Konfiguration kann dazu führen, dass Serveranfälligkeiten ausgenutzt werden, um den Dienst zu unterbrechen oder unzugänglich zu machen.
- **Cross-Site Scripting (XSS) oder SQL Injection:** Fehlerhafte Konfigurationen können dazu führen, dass Sicherheitslücken in der Webanwendung entstehen, die für diese Angriffsarten anfällig sind.

### 4. Mögliche Folgen für Unternehmen

- **Finanzielle Verluste:** Angreifer können durch das Ausnutzen von Security Misconfiguration direkt finanzielle Schäden verursachen, etwa durch Datenverlust oder betrügerische Transaktionen.
- **Reputationsschäden:** Wenn vertrauliche Daten kompromittiert werden, kann das Vertrauen der Kunden in das Unternehmen erheblich beeinträchtigt werden.
- **Rechtliche Konsequenzen:** Die Verletzung von Datenschutzbestimmungen, wie der DSGVO, kann zu rechtlichen Strafen führen, wenn Daten durch unsichere Konfigurationen entwendet werden.

### 5. Präventionsmassnahmen

Um Sicherheitsfehler durch fehlerhafte Konfiguration zu verhindern, sollten die folgenden Best Practices beachtet werden:

- **Regelmässige Sicherheitsüberprüfungen:** Unternehmen sollten ihre Systeme regelmässig auf Sicherheitslücken hin überprüfen und alle Softwarekomponenten aktuell halten.
- **Verwendung sicherer Konfigurationen:** Stelle sicher, dass alle Standardkennwörter geändert werden und sichere Konfigurationen genutzt werden.
- **Minimierung der Angriffsfläche:** Nur die notwendigsten Dienste sollten aktiviert sein, und nicht benötigte Ports oder Dienste sollten deaktiviert werden.
- **Zugriffssteuerung:** Implementiere eine strikte Zugriffskontrolle und stelle sicher, dass nur autorisierte Benutzer Zugriff auf sensitive Daten haben.
- **Automatisierung von Sicherheitsprozessen:** Tools zur Automatisierung von Sicherheitsüberprüfungen und Konfigurationsänderungen können helfen, menschliche Fehler zu vermeiden.

### 6. Fazit

Security Misconfiguration ist eine der häufigsten und gefährlichsten Sicherheitslücken, die in modernen IT-Systemen auftreten kann. Um diesen Risiken vorzubeugen, ist es wichtig, auf sichere Konfigurationen zu achten, regelmässig Updates durchzuführen und beständige Sicherheitsüberprüfungen vorzunehmen. Nur so kann gewährleistet werden, dass Systeme und Anwendungen sicher und vor Angriffen geschützt bleiben.


