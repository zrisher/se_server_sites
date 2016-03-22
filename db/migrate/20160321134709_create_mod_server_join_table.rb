class CreateModServerJoinTable < ActiveRecord::Migration
  def change
    create_table :mods_servers, id: false do |t|
      t.belongs_to :mod, index: true
      t.belongs_to :server, index: true
    end
  end
end
