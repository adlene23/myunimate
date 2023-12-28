from flask import Blueprint, jsonify, request
from app.utils.database import connect_to_supabase

# Create a blueprint for home routes
profile_bp = Blueprint('profile', __name__)

# Define the route and function
@profile_bp.route('/get_avatar_url', methods=['GET'])
def get_avatar_url():
    try:
        supabase = connect_to_supabase()
        user_id = request.args.get('user_id')

        # Query Supabase to get the avatar URL based on user ID
        result = supabase.from_('users').select('avatar_url').eq('id', user_id).execute()

        if len(result['data']) > 0:
            avatar_url = result['data'][0]['avatar_url']
            return jsonify({'avatar_url': avatar_url}), 200
        else:
            return jsonify({'error': 'User not found'}), 404

    except Exception as e:
        return jsonify({'error': str(e)}), 500
