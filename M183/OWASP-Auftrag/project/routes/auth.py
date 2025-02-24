from flask import Blueprint
import secrets

auth_bp = Blueprint('auth', __name__)

#Generierung von Sitzungsverwaltungstoken
@auth_bp.route('/generate_token')
def generate_token():
    return {"token": secrets.token_hex(32)}
