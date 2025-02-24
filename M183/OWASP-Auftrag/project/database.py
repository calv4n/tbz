import sqlite3

#Verbinden zur Datenbank
def get_db():
    conn = sqlite3.connect("database.db")
    return conn
