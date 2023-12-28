from flask import Blueprint, jsonify
from app.utils.database import connect_to_supabase

# Create a blueprint for home routes
bp = Blueprint('home', __name__)

# Define the route and function
@bp.route('/')
def hello():
  user_id = request.args.get('user_id')
  return jsonify({'id':user_id})
