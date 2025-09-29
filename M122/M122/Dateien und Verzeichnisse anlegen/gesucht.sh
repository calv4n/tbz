#!/bin/bash


# Name der Datei mit Klassennamen und Schülernamen
filename="klasse_schueler.txt"


# Lesen des Klassennamens aus der Datei
read -r klassenname < "$filename"


# Lesen der Schülernamen aus der Datei in eine Liste
readarray -t namen < <(tail -n +2 "$filename")


# Template-Verzeichnis, in dem die gewünschten Dateien liegen
template_dir="template"


# Schleife über alle Namen in der Listex
for name in "${namen[@]}"; do
 
 # Erstellen des Verzeichnisses für den Lernenden im Klassenverzeichnis
 lernenden_dir="${klassenname}/${name}"
 mkdir -p "${lernenden_dir}"

 # Kopieren der gewünschten Dateien aus dem Template-Verzeichnis in das Verzeichnis des Lernenden
 cp "${template_dir}/Datei-1.txt" "${lernenden_dir}"
 cp "${template_dir}/Datei-2.docx" "${lernenden_dir}"
 cp "${template_dir}/Datei-3.pdf" "${lernenden_dir}"
done