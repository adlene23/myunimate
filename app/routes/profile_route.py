from flask import Blueprint, jsonify
from app.utils.database import connect_to_supabase

# Create a blueprint for home routes
profile_bp = Blueprint('profile', __name__)

# Define the route and function
@profile_bp.route('profile', methods=['POST'])
def profile():
   
    return jsonify({'message': 'Signup failed', 'errors': ['hello']}), 400
