from flask import Blueprint, g
import sqlite3

users_bp = Blueprint('users', __name__)

DATABASE = 'database.db'

def get_db():
    if not hasattr(g, 'db'):
        g.db = sqlite3.connect(DATABASE)
    return g.db

@users_bp.route('/<username>')
def get_user(username):
    conn = get_db()
    cursor = conn.cursor()
    query = "SELECT * FROM users WHERE username = ?"
    cursor.execute(query, (username,))
    return {"user": cursor.fetchall()}
