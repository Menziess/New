from flask import Blueprint, abort, jsonify, request, render_template

routes = Blueprint('routes', __name__, template_folder="template")


@routes.route("/")
@routes.route("/<int:T>")
def show_index(T=None):

    return render_template('index.html', T=T)
