import sqlite3

# Datenbank initialisieren

conn = sqlite3.connect('database.db')
cursor = conn.cursor()

cursor.execute('''
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
)
''')

cursor.execute("INSERT INTO users (username, password) VALUES ('testuser', 'securepass')")
conn.commit()
conn.close()

print("Datenbank wurde initialisiert.")
