class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :domain
      t.integer :port
      t.string :steam_group_url
      t.string :mumble_domain
      t.integer :mumble_port
      t.string :mumble_channel
      t.text :description
      t.text :rules
      t.text :settings
      t.text :roadmap

      t.timestamps null: false
    end
  end
end
