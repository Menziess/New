from flask import Flask, jsonify
from backend.routes import routes
import socket
import os

# Boot app
app = Flask(__name__,
            static_folder="./frontend/static",
            template_folder="./frontend")

# Register routes
app.register_blueprint(routes)


# Handle generic 404
@app.errorhandler(404)
def not_found(e):
    return jsonify({
        'title': e.name,
        'status': e.code,
        'detail': e.description,
    })


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80, debug=True)
