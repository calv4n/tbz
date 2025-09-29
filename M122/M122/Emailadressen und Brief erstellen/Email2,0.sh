#!/bin/bash

# This script imports a CSV file from an FTP server, generates email addresses and passwords, creates letters with the new email addresses and passwords, compresses them into an archive file, sends an email notification with the archive file, uploads the archive file to the FTP server, and then cleans up temporary files.

# Configuration variables
FTP_SERVER="ftp.haraldmueller.ch"
FTP_USER="schueler"
FTP_PASSWORD="studentenpasswort"
DOMAIN="tbz.ch"
MAIL_TO="calvin.pfrender@edu.tbz.ch"

# Step 1: Import CSV file from FTP server
curl -O ftp://$FTP_SERVER/M122-AP22b/MOCK_DATA.csv --user $FTP_USER:$FTP_PASSWORD

# Step 2: Generate email addresses and passwords
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
while IFS=, read -r id first_name last_name gender street street_number zip_code city
do
    # Generate email address and password
    username=$(echo "$first_name.$last_name" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]//g')
    password=$(openssl rand -base64 12 | tr -d '/+' | cut -c -8)
    
    # Generate TBZ email address
    tbz_email=$(echo "$first_name.$last_name" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]//g')
    
    # Save data to CSV file
    echo "$username@$DOMAIN;$password;$id;$first_name;$last_name;$gender;$street;$street_number;$zip_code;$city;$tbz_email@$DOMAIN" >> "$timestamp"_mailimports.csv
done < MOCK_DATA.csv

# Step 3: Create letters with new email addresses and passwords
while IFS=';' read -r email password id first_name last_name gender street street_number zip_code city tbz_email
do
    # Generate letter file
    letter_filename="$timestamp"_"$email".brf
    echo "Technische Berufsschule Zürich
Ausstellungsstrasse 70
8005 Zürich

Zürich, den $(date +%d.%m.%Y)

						$first_name $last_name
						$street $street_number
						$zip_code $city
								

Liebe:r $first_name,

Es freut uns, Sie im neuen Schuljahr begrüssen zu dürfen.

Damit Sie am ersten Tag sich in unsere Systeme einloggen
können, erhalten Sie hier Ihre neue Emailadresse und Ihr
Initialpasswort, das Sie beim ersten Login wechseln müssen.

Emailadresse:   $email
Passwort:       $password


Mit freundlichen Grüssen

$first_name $last_name
(TBZ-IT-Service)


admin.it@tbz.ch, Abt. IT: +41 44 446 96 60" > "$letter_filename"

done < "$timestamp"_mailimports.csv

# Step 4: Compress files into archive
zip -r NewMails_"$timestamp"_AP22b_CPfrender.zip "$timestamp"_mailimports.csv "$timestamp"_*.brf

# Step 5: Send email notification with archive
number_of_new_mails=$(wc -l < "$timestamp"_mailimports.csv)
mail_subject="Neue TBZ-Mailadressen $number_of_new_mails"
mail_body="Lieber/r [Name],

die Emailadressen-Generierung ist beendet. Es wurden $number_of_new_mails erzeugt.

Bei Fragen kontaktiere bitte $tbz_email.

Gruss $first_name $last_name"
mail_attachment=$timestamp"_AP22b_CPfrender.zip"
mail -s "$mail_subject" "$MAIL_TO" <<< "$mail_body" -a "$mail_attachment"

# Step 6: Upload archive file to FTP server
ftp -n <<EOF
open $FTP_SERVER
user $FTP_USER $FTP_PASSWORD
cd /M122-AP22b
put NewMails_"$timestamp"_AP22b_CMeile.zip
quit
EOF

# Step 7: Clean up temporary files
rm MOCK_DATA.csv
rm "$timestamp"_mailimports.csv
rm "$timestamp"_*.brf
rm NewMails_"$timestamp"_AP22b_CPfrender.zip