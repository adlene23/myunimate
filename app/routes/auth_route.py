from flask import Blueprint, request, jsonify
import re
from app.utils.database import connect_to_supabase

auth_bp = Blueprint('auth', __name__)

# Function to handle user signup
@auth_bp.route('/signup', methods=['POST'])
def signup():
    supabase = connect_to_supabase()

    data = request.form
    email = data.get('email')
    password = data.get('password')
    confirm_password = data.get('confirmPassword')
    name = data.get('name')
    avatar = request.files.get('avatar')
    errors = []

    # Validation functions
    def is_valid_email(email):
        pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
        return re.match(pattern, email) is not None

    def is_valid_password(password, confirm_password):
        if not password or len(password) < 8:
            return 'Password should be at least 8 characters long'
        elif password != confirm_password:
            return 'Passwords do not match'
        return None

    # Validate email
    if not email or not is_valid_email(email):
        errors.append('Email needs to be valid')

    # Validate password
    password_error = is_valid_password(password, confirm_password)
    if password_error:
        errors.append(password_error)

    # Check for existing user
    existing_user = supabase.table('users').select("*").ilike('email', email).execute()
    if len(existing_user.data) > 0:
        errors.append('User already exists')

    # If errors, return them
    if errors:
        return jsonify({'message': 'Signup failed', 'errors': errors}), 400
    
    # Signup the user
    try:
        res = supabase.auth.sign_up({'email': email, 'password': password})
        user_info = res.user
        if user_info:
            user_id = user_info.id
            user_email = user_info.email
            url = None
            
            if avatar:
                # Upload the avatar image to Supabase storage
                supabase.storage.from_("avatars").upload(
                    file=avatar.read(),  # Read the content of the image file
                    path=f'avatars/{user_id}/avatar',  # Specify the destination path in storage
                    file_options={"content-type": avatar.mimetype}  # Set the content type of the file
                )

                # Get the public URL of the uploaded avatar image
                url = supabase.storage.from_('avatars').get_public_url(f'avatars/{user_id}/avatar')

                user_data = {'id': user_id, 'email': email, 'name': name, 'avatar_url': url}
                supabase.table('users').insert(user_data).execute()

        return jsonify({
            'id': user_id,
            'email': user_email,
            'name': name,
            'avatarUrl': url
        }), 200
    except Exception as ex:
        return jsonify({'message': 'Signup failed', 'errors': [str(ex)]}), 400


@auth_bp.route('/signin', methods=['POST'])
def signin():
    supabase = connect_to_supabase()
    data = request.json

    try:
        res = supabase.auth.sign_in_with_password({'email': data.get('email'), 'password': data.get('password')})
    except Exception as ex:
        return jsonify({'message': 'Login failed', 'errors': ex.args}), 400

    user_info = res.user

    if user_info:
        user_id = user_info.id
        user_email = user_info.email
        response = supabase.table('users').select('name', 'avatar_url').eq('id', user_id).execute()

        return jsonify({
            'id': user_id,
            'email': user_email,
            'name': response.data[0]['name'],
            'avatarUrl': response.data[0]['avatar_url']
        }), 200
    else:
        return jsonify({'message': 'Sign-in failed! User information not found'}), 400
