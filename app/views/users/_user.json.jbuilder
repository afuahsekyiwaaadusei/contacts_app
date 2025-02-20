json.extract! user, :id, :user_code, :first_name, :last_name, :username, :mobile_number, :image_path, :first_login, :active_status, :del_status, :creator_id, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
