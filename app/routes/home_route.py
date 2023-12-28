from flask import Blueprint, jsonify
from app.utils.database import connect_to_supabase
from flask import request


# Create a blueprint for home routes
bp = Blueprint('home', __name__)

# Define the route and function
@bp.route('/')
def hello():

  user_id = request.args.get('user_id')
  
  return jsonify({'id' :request.args})
