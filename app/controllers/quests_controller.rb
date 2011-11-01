class QuestsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @quests=Quest.all
    @list_header = "Listing All Quests"
  end
  
  def new
    @subtitle = "New Quest"
    @quest=Quest.new
  end
  
  def show
    @quest=Quest.find(params[:id])
    @user=User.find(@quest.created_by)
    @new_assignment= @quest.assignments.build
    @assignment_exists = current_user.nil? ? nil : @quest.assignments.find_by_quester_id(current_user.id)
  end
  
  def create
    @quest = Quest.create params[:quest]
    @quest.created_by = current_user
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
    
  def destroy
    Quest.destroy(params[:id])
    redirect_to quests_path
  end


end
