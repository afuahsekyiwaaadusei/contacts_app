class CreateEntityInfos < ActiveRecord::Migration[8.0]
  def change
    unless table_exists?(:entity_infos)
      create_table :entity_infos do |t|
        t.string :assigned_code, null: false
        t.string :entity_name, null: false
        t.string :entity_alias, limit: 50, null: false
        t.string :narration, limit: 255
        t.boolean :active_status, default: true
        t.boolean :del_status, default: false
        t.integer :user_id

        t.timestamps
      end

      # Adding indexes
      add_index :entity_infos, :assigned_code, unique: true
      add_index :entity_infos, :entity_name, unique: true
      add_index :entity_infos, :entity_alias, unique: true, where: "entity_alias IS NOT NULL"
      add_index :entity_infos, [ :active_status, :del_status ]
    end
  end
end
