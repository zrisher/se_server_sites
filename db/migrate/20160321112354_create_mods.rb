class CreateMods < ActiveRecord::Migration
  def change
    create_table :mods do |t|
      t.integer :steam_id
      t.string :steam_url
      t.string :steam_name
      t.string :steam_image_url

      t.timestamps null: false
    end
  end
end
