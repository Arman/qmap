class AddStartLocationToQuests < ActiveRecord::Migration
  def self.up
    add_column :quests, :address, :string  
    add_column :quests, :latitude, :float  
    add_column :quests, :longitude, :float  
  end

  def self.down
    remove_column :quests, :address
    remove_column :quests, :latitude
    remove_column :quests, :longitude
  end
end
