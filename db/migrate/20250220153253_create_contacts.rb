class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:contacts)
      create_table :contacts do |t|
        t.string :first_name, null: false
        t.string :last_name
        t.string :phone_number, null: false
        t.string :email
        t.string :image_path

        t.timestamps
      end

      # Adding indexes
      add_index :contacts, :first_name
      add_index :contacts, :last_name
      add_index :contacts, :phone_number
    end
  end
end
