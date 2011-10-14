class AddRewardsToQuests < ActiveRecord::Migration
  def self.up
    add_column :quests, :cash_reward_amount, :integer  
    add_column :quests, :point_reward_amount, :integer  
    add_column :quests, :special_reward_description, :text  
  end

  def self.down
    remove_column :quests, :cash_reward_amount 
    remove_column :quests, :point_reward_amount
    remove_column :quests, :special_reward_description
  end
end
