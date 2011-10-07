require 'spec_helper'

describe "Quests" do

  describe "new" do

    describe "failure" do
      it "should not make a new quest" do
        lambda do
          visit new_quest_path
          fill_in "quest_name",         :with => ""
          fill_in "quest_description",        :with => ""
          click_button
          response.should render_template('quests/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(Quest, :count)
      end
    end
    
    describe "success" do

      it "should make a new quest" do
        lambda do
          visit new_quest_path
          fill_in "quest_name",         :with => "Example Quest"
          fill_in "quest_description",     :with => "foobar"
          click_button
          response.should have_selector("div.flash.success")
          response.should render_template('quests/show')
        end.should change(Quest, :count).by(1)
      end
    end

    
    
  end
end
