require 'spec_helper'

describe Quest do

  before(:each) do
    @attr = { :name => "Simple Quest of Doom", :description => "A wonderfully simple quest. Just count to 3 and you are done."}
  end

  it "should create a new instance given valid attributes" do
    Quest.create!(@attr)
  end

  it "should require a name" do
    no_name_quest = Quest.new(@attr.merge(:name => ""))
    no_name_quest.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 151
    long_name_quest = User.new(@attr.merge(:name => long_name))
    long_name_quest.should_not be_valid
  end

end
