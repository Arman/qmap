class Assignment < ActiveRecord::Base
  
  belongs_to :quest
  belongs_to :quester, :class_name => "User", :foreign_key => 
                      "quester_id"
                      
  validates :quester,  :presence => true
  validates :quest,  :presence => true                    
  
end

