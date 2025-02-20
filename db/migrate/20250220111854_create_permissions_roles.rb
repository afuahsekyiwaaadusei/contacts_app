class CreatePermissionsRoles < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:permissions_roles)
      create_table :permissions_roles do |t|
        t.integer :permission_id
        t.string :role_code

        t.timestamps
      end
    end
  end
end
