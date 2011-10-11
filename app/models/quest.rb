class Quest < ActiveRecord::Base
  attr_accessible :name, :description, :due_date,:address,:latitude,:longitude  
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  belongs_to :created_by, :class_name => "User", :foreign_key => 
                      "created_by"
                      
  
  
  validates :name,  :presence => true,
                    :length   => { :maximum => 150 }
                    
  validates :created_by,  :presence => true,


end
