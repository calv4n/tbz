#!/bin/bash

# Setzen Sie den Klassennamen und die Dateinamen
class_name="M122-AP22b"
file_names=("Datei-1.txt" "Datei-2.docx" "Datei-3.pdf")
# Erstellen Sie das Klassenverzeichnis
mkdir $class_name

# Lesen Sie die Schülernamen aus der Datei
while read student_name; do

    # Erstellen Sie das Verzeichnis für den Schüler
    mkdir "$class_name/$student_name"
    # Kopieren Sie die Dateien in das Verzeichnis des Schülers
    for file_name in "${file_names[@]}"; do
        touch "$class_name/$student_name/$file_name"
    done
done <"$class_name.txt"
