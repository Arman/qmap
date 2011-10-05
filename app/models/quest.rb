class Quest < ActiveRecord::Base
  
  attr_accessible :name, :description, :due_date
  
  validates :name,  :presence => true,
                    :length   => { :maximum => 150 }


end
