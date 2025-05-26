Aufgabe 3.
 
### Aufgabe 3 – Eigene Pure Functions mit Rekursion
 
#### Aufgabe 3.1 – Summe einer Liste von Zahlen berechnen
```javascript
function sumList(numbers) {
    if (numbers.length === 0) return 0;
    return numbers[0] + sumList(numbers.slice(1));
}
```
 
---
 
#### Aufgabe 3.2 – Mittelwert einer Liste von Zahlen berechnen
```javascript
function averageList(numbers) {
    function sum(nums) {
        if (nums.length === 0) return 0;
        return nums[0] + sum(nums.slice(1));
    }
 
    return numbers.length === 0 ? 0 : sum(numbers) / numbers.length;
}
```
 
---
 
#### Aufgabe 3.3 – Liste von Strings alphabetisch sortieren (rekursiv)
```javascript
function sortStringsAlphabetically(list) {
    if (list.length <= 1) return list;
 
    const [pivot, ...rest] = list;
    const left = sortStringsAlphabetically(rest.filter(x => x.localeCompare(pivot) < 0));
    const right = sortStringsAlphabetically(rest.filter(x => x.localeCompare(pivot) >= 0));
 
    return [...left, pivot, ...right];
}
```
 
---
 
#### Aufgabe 3.4 – Objekte nach Datum, Priorität und Titel sortieren
```javascript
function sortObjectsRecursive(list) {
    if (list.length <= 1) return list;
 
    const [pivot, ...rest] = list;
 
    const compare = (a, b) => {
        const dateA = new Date(a.datum);
        const dateB = new Date(b.datum);
        if (dateA < dateB) return -1;
        if (dateA > dateB) return 1;
 
        if (a.prioritaet < b.prioritaet) return -1;
        if (a.prioritaet > b.prioritaet) return 1;
 
        return a.titel.localeCompare(b.titel);
    };
 
    const left = sortObjectsRecursive(rest.filter(obj => compare(obj, pivot) < 0));
    const right = sortObjectsRecursive(rest.filter(obj => compare(obj, pivot) >= 0));
 
    return [...left, pivot, ...right];
}
```
 
---
 
#### Aufgabe 3.5 – Alle Blätter einer Baumstruktur extrahieren
```javascript
function extractLeaves(tree) {
    if (!tree || !Array.isArray(tree.children) || tree.children.length === 0) {
        return [tree];
    }
 
    return tree.children.flatMap(child => extractLeaves(child));
}
```
 
**Beispielbaum:**
```javascript
const tree = {
    name: 'root',
    children: [
        { name: 'leaf1', children: [] },
        {
            name: 'node2',
            children: [
                { name: 'leaf2', children: [] },
                { name: 'leaf3', children: [] }
            ]
        }
    ]
};
 
console.log(extractLeaves(tree));
// Ausgabe: [{name: 'leaf1', children: []}, {name: 'leaf2', children: []}, {name: 'leaf3', children: []}]
```
 