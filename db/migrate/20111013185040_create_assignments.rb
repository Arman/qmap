class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :quest_id
      t.integer :quester_id
      t.timestamp :responded_at
      t.timestamp :complated_at
      t.timestamp :rewarded_at
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
