class AddCreatedByToQuests < ActiveRecord::Migration


  def self.up 

    add_column :quests, :created_by, :integer  

  end 

  def self.down 

    remove_column :quests, :created_by

  end

end
