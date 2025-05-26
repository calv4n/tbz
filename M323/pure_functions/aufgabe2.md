### Aufgabe 2 – Umschreiben von Impure zu Pure Functions
 
#### Aufgabe 1.1 – `addToCart(item)`
**Original (Impure):**
```javascript
let cartItems = [];
 
function addToCart(item) {
    cartItems.push(item);
    return cartItems;
}
```
 
**Umschreibung (Pure):**
```javascript
function addToCartPure(cartItems, item) {
    return [...cartItems, item];
}
```
 
**Erklärung:**
Die ursprüngliche Funktion verändert die äußere Variable `cartItems`, was ein Side-Effect ist. In der puren Version wird die Liste übergeben und eine neue Liste zurückgegeben. Damit ist die Funktion rein – keine Seiteneffekte, keine Änderungen an existierenden Werten.
 
---
 
#### Aufgabe 1.4 – `multiplyWithRandom(number)`
**Original (Impure):**
```javascript
function multiplyWithRandom(number) {
    const randomValue = Math.random();
    return number * randomValue;
}
```
 
**Umschreibung (Pure):**
```javascript
function multiplyWithGivenRandom(number, randomValue) {
    return number * randomValue;
}
```
 
**Erklärung:**
`Math.random()` liefert einen unvorhersehbaren Wert – das macht die Funktion *impure*. In der puren Variante wird der Zufallswert als Parameter übergeben, sodass die Funktion vollständig kontrolliert und testbar ist.
 
---
 
#### Aufgabe 1.6 – `printAndReturnString(str)`
**Original (Impure):**
```javascript
function printAndReturnString(str) {
    console.log(str);
    return str;
}
```
 
**Umschreibung (Pure):**
```javascript
function returnStringPure(str) {
    return str;
}
```
 
**Erklärung:**
`console.log` ist ein Side-Effect und verletzt das Pure-Function-Prinzip. In der puren Version wird nur der Rückgabewert geliefert. Wenn die Ausgabe erforderlich ist, kann das Logging außerhalb der Funktion erfolgen.
 
---
 
### Erkenntnisse:
 
- **Seiteneffekte** wie Zugriff auf äußere Variablen (`cartItems`) oder Ausgaben auf die Konsole (`console.log`) machen Funktionen *impure*.
- **Zufall und Zeit** (wie `Math.random()` oder `Date.now()`) führen immer zu *Impurity*, da die Funktion bei gleichen Parametern unterschiedliche Ergebnisse liefert.
- Pure Functions sind **leichter testbar, vorhersehbar und wiederverwendbar**, da sie keine versteckten Abhängigkeiten haben.
 
---