from flask import Blueprint, jsonify, request
from app.utils.database import connect_to_supabase

# Create a blueprint for home routes
profile_bp = Blueprint('profile', __name__)

# Define the route and function
@profile_bp.route('/get_avatar_url', methods=['GET'])
def get_avatar_url():
    
        supabase = connect_to_supabase()
        user_id = request.args.get('user_id')
        return jsonify({'message': user_id}), 
    
  