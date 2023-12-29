from flask import Blueprint, jsonify, request
from app.utils.database import connect_to_supabase
import os

# Create a blueprint for home routes
profile_bp = Blueprint('profile', __name__)

# Define the route and function
@profile_bp.route('/editprofile', methods=['POST'])
def edit_profile():
    try:
        supabase = connect_to_supabase()
        data = request.form
        bio = data.get('bio')
        name = data.get('name')
        userid = data.get('userid')
        avatar = request.files.get('avatar')

        # Check if the user exists
        existing_user = supabase.from_('users').select('*').eq('id', userid).execute()

        if len(existing_user['data']) > 0:
            # User exists, update the profile
            user_data = {'name': name}

            if bio:
                user_data['bio'] = bio

            if avatar:
              
                avatar_filename =f'avatars/{userid}/avatar',

                # Upload the new avatar image to Supabase storage with the unique filename
                supabase.storage.from_("avatars").upload(
                    file=avatar.read(),
                    path=avatar_filename,
                     file_options={"content-type": avatar.mimetype}  
                )

                # Get the public URL of the uploaded avatar image
                avatar_url = supabase.storage.from_('avatars').get_public_url(avatar_filename)
                user_data['avatar_url'] = avatar_url

                # If the new avatar is uploaded successfully, remove the previous avatar
                previous_avatar_url = existing_user['data'][0].get('avatar_url')
                if previous_avatar_url:
                    supabase.storage.from_("avatars").delete(previous_avatar_url)

            # Update the user's profile
            supabase.from_('users').update(user_data).eq('id', userid).execute()
            return jsonify({
           
            'name': name,
            'avatarUrl':avatar,
            'bio':bio
        }), 200
            

            
        else:
            # User not found
            return jsonify({'error': 'User not found'}), 404

    except Exception as e:
        return jsonify({'error': str(e)}), 500
