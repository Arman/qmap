class QuestsController < ApplicationController
  
  def index
    @quests=Quest.all
  end
  
  def new
    @subtitle = "New Quest"
    @quest=Quest.new
  end
  
  def show
    @quest=Quest.find(params[:id])
  end
  
  def create
    @quest = Quest.create params[:quest]
    if @quest.save
      redirect_to quests_path
    else
      redirect_to new_quest_path
    end
  end
  
  def edit
    @quest = Quest.find(params[:id])
  end

  def update
    @quest = Quest.find(params[:id])
    if @quest.update_attributes(params[:quest])
      flas
      redirect_to quest_path(@quest)
    else
      redirect_to edit_quest_path(@quest)
    end
  end
  
  def delete
      Quest.find(params[:id]).destroy
      redirect_to quests_path
   end


end
