#!/bin/bash

# Name der Datei mit den Schülernamen
namen_file="schueler.txt"


# Lesen der Schülernamen in eine Liste
readarray -t namen < "$namen_file"


# Name der Datei mit dem Klassennamen
klassenname_file="klasse.txt"


# Lesen des Klassennamens aus der Datei
read -r klassenname < "$klassenname_file"


# Schreiben der Namen in eine Textdatei
printf '%s\n' "${namen[@]}" > "${klassenname}.txt"


# Template-Verzeichnis erstellen
template_dir="template"
mkdir -p "${template_dir}"


# Gewünschte Dateien in Template-Verzeichnis kopieren
touch "${template_dir}/Datei-1.txt"
touch "${template_dir}/Datei-2.docx"
touch "${template_dir}/Datei-3.pdf"