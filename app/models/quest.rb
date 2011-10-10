class Quest < ActiveRecord::Base
  
  belongs_to :created_by, :class_name => "User", :foreign_key => 
                      "created_by"
                      
  attr_accessible :name, :description, :due_date
  
  validates :name,  :presence => true,
                    :length   => { :maximum => 150 }
                    
  validates :created_by,  :presence => true,


end
