from flask import Blueprint, request, abort

admin_bp = Blueprint('admin', __name__)

# Admin user
users = {"admin": "secret"}

@admin_bp.route('/')
def admin_dashboard():
    auth = request.authorization
    # Zugriff verweigern, falls nicht authentifiziert
    if not auth or users.get(auth.username) != auth.password:
        abort(403)
    return "Admin Dashboard"

# curl -u admin:secret -L http://localhost:5000/admin

