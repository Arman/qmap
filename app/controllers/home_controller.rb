class HomeController < ApplicationController
  def index
    @subtitle = "Home"
    @quests = Quest.all
  end
end
