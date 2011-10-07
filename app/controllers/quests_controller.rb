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
      flash[:success] = "A new quest has been created!"
      redirect_to @quest
    else
      render 'new'
    end
  end
  
  def edit
    @quest = Quest.find(params[:id])
  end

  def update
    @quest = Quest.find(params[:id])
    if @quest.update_attributes(params[:quest])
      flash[:success] = "Your quest has been updated!"
      redirect_to @quest
    else
      render 'edit'
    end
  end
  
  def delete
      Quest.find(params[:id]).destroy
      redirect_to quests_path
   end


end
