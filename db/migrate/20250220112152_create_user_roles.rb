class CreateUserRoles < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:user_roles)
      create_table :user_roles do |t|
        t.string :role_code, null: false
        t.string :user_code
        t.string :entity_code
        t.string :creator_id
        t.boolean :active_status, default: true
        t.boolean :del_status, default: false

        t.timestamps
      end
    end
  end
end
