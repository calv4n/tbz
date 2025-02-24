from flask import Flask
from routes.admin import admin_bp
from routes.auth import auth_bp
from routes.users import users_bp

app = Flask(__name__)

#Einzelne routes verteilt
app.register_blueprint(admin_bp, url_prefix='/admin')
app.register_blueprint(auth_bp, url_prefix='/auth')
app.register_blueprint(users_bp, url_prefix='/users')

if __name__ == "__main__":
    app.run(debug=True)
