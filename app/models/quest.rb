class Quest < ActiveRecord::Base
  attr_accessible :name, :description, :due_date, :address, :latitude, :longitude, :cash_reward_amount, :point_reward_amount, :special_reward_description
  
  acts_as_gmappable :process_geocoding => false, :lat => "latitude", :lng => "longitude" 
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  
  belongs_to :created_by, :class_name => "User", :foreign_key => 
                      "created_by"
  
  has_many :assignments
  has_many :questers, :through => :assignments
                    
                    
  
  validates :name,  :presence => true,
                    :length   => { :maximum => 150 }
                    
  validates :created_by,  :presence => true
  
  validate :any_present?

  def any_present?
    if %w(cash_reward_quantity point_reward_quantity special_reward).all?{|attr| self[attr].blank?&&self[attr].to_s>"0"}
      errors.add_to_base("You should provide at least one type of reward!")
    end
  end

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}" 
  end
  
  def gmaps4rails_infowindow
    # add here whatever html content you desire, it will be displayed when users clicks on the marker
    "#{self.name}" 
  end


end
