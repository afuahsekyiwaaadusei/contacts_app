class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:users)
      create_table :users do |t|
        t.string :user_code, null: false
        t.string :first_name, null: false
        t.string :last_name, null: false
        t.string :username, null: false
        t.string :mobile_number, null: false
        t.string :image_path
        t.boolean :first_login, null: false, default: true
        t.boolean :active_status, default: true
        t.boolean :del_status, default: false
        t.string :creator_id

        ## Database authenticatable (Devise fields)
        t.string :email,              null: false, default: ''
        t.string :encrypted_password, null: false, default: ''

        ## Recoverable
        t.string   :reset_password_token
        t.datetime :reset_password_sent_at

        ## Rememberable
        t.datetime :remember_created_at

        ## Lockable
        t.integer  :failed_attempts, default: 0, null: false
        t.string   :unlock_token
        t.datetime :locked_at

        t.timestamps
      end

      add_index :users, :user_code, unique: true, where: 'active_status = true'
      add_index :users, :username, unique: true, where: 'active_status = true'
      add_index :users, :email, unique: true, where: 'active_status = true'
      add_index :users, :reset_password_token, unique: true, where: 'active_status = true'
    end
  end
end
