class CreatePermissions < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:permissions)
      create_table :permissions do |t|
        t.string :subject_class
        t.string :action
        t.string :name
        t.string :comment
        t.boolean :active_status, default: true
        t.boolean :del_status, default: false

        t.timestamps
      end
    end
  end
end
