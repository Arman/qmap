class AssignmentsController < ApplicationController
  
  before_filter :require_user_and_redirect_to_quest, :only => [:create]
	
  before_filter :require_user, :except => [:show, :index, :create] 
  
  def index
    @assignments = Assignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reviews }
    end
  end

  def show
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assignment }
    end
  end

  def new
    @assignment = Assignment.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assignment }
    end
  end
  
  def edit
    @assignment = Assignment.find(params[:id])
  end

  def create
    @quest = Quest.find(params[:quest_id])
    @assignment = @quest.assignments.create(params[:assignment])
    @assignment.quester_id = current_user
    if @assignment.save
      flash[:notice] = 'You are on a quest!!'
      redirect_to quest_path(@quest)   
    else
      flash[:notice] = 'There was a problem!!'
      redirect_to quest_path(@quest)   
    end
  end

  def update
    @assignment = Assignment.find(params[:id])
    @assignment.quester_id = current_user.id
    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        flash[:notice] = 'Assignment was successfully updated.'
        format.html { redirect_to :back }
        #format.html { redirect_to(@assignment) }
        format.xml  { head :ok }
      else
        format.html { redirect_to :back }
        #format.html { render :action => "edit" }
        format.xml  { render :xml => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      #format.html { redirect_to(assignments_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def require_user_and_redirect_to_quest
    return true if current_user
    store_referer
    redirect_to new_user_session_url
    return false
  end
  
end
