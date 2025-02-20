class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:roles)
      create_table :roles do |t|
        t.string :name
        t.string :role_code
        t.string :role_type
        t.boolean :active_status, default: true
        t.boolean :del_status, default: false

        t.timestamps
      end
    end
  end
end
