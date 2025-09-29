#!/bin/bash

# Ordner für die Klasse erstellen
classname=${PWD##*/}
mkdir "$classname"

# Liste mit Namen aller Lernenden einlesen
while read name; do
  # Verzeichnis für den Lernenden erstellen und in das Klassenverzeichnis kopieren
  mkdir "$classname/$name"
  cp -r Template/. "$classname/$name"

  # Dateinamen für den Lernenden festlegen
  txt_file="$classname/$name/Datei-1.txt"
  pdf_file="$classname/$name/Datei-2.pdf"
  docx_file="$classname/$name/Datei-3.docx"

  # Dateien mit dem Namen des Lernenden erstellen
  touch "$txt_file"
  touch "$pdf_file"
  touch "$docx_file"

done < "$classname.txt"