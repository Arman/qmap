class HomeController < ApplicationController
   
  def index
    @subtitle = "Home"
    if params[:search].present? && params[:search_near].present?
      @quests = Quest.near(params[:search], 50, :order => :distance)
      @list_header = "There are " + @quests.count.count.to_s + " active quests nearby."
    else
      @quests = Quest.all
      @list_header = "Showing all " + @quests.count.to_s + " active quests."
    end
  end

end
