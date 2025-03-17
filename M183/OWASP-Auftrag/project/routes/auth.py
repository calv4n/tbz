from flask import Blueprint
import secrets

auth_bp = Blueprint('auth', __name__)

#Generierung von Sitzungsverwaltungstoken
@auth_bp.route('/generate_token')
def generate_token():
    return {"token": secrets.token_hex(32)}

print(generate_token())

# http://127.0.0.1:5000/auth/generate_token