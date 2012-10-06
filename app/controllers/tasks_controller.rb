
class TasksController < ApplicationController
  load_and_authorize_resource :customer
  load_and_authorize_resource :through => :customer , :except => :create
  
  include FormAjaxHelper
  
  def initialize()
    @no_layout = false
  end
  
  def index
    respond_to do |format|
      format.json do
         @content = render_to_string( :template => "tasks/_list", :locals => { items: @customer.tasks.paginate(page:params[:task_page] || 1, per_page: 3) }, :formats => :html, :layout => false)
         #render :json => { html: @content }, :content_type => "application/json"
         render :json => @content, :content_type => "application/json"
      end
      format.js { head :no_content }
      format.html #
    end
  end
  
  def show
    respond_to do |format| 
      format.js { @no_layout = true }
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def new
    @task.feedbacks.build
    @task.feedbacks.build
  end
  
  def create
    #remove conficts
    feedback_params = params[:task][:feedbacks]
    params[:task].delete :feedbacks
    
    #not loaded task for incompatibilities
    @task = @customer.tasks.build(params[:task])
    @task.feedbacks.build(feedback_params)
    
    @task.status = SystemTaskStatus.OPENED
    @task.user = current_user
    
    #filled feedback?
    if (@task.feedbacks.size == 1)
      feedback = @task.feedbacks[0]
      if @task.feedbacks[0].valid?
        #TODO: Business Rule. Put in model
        @task.resolution = feedback.resolution
        @task.status = SystemTaskStatus.CLOSED
        @task.finish_time = Time.now
      else
        if (@task.feedbacks[0].resolution.nil? && @task.feedbacks[0].notes.empty?)
          @task.feedbacks.delete(@task.feedbacks[0])
        end
      end
    end
    
    respond_to do |format|
      if @task.save
        format.js { render :locals => { :task => @task }, :layout => false, :content_type => "application/javascript", :status => :created }
        format.html { redirect_to @comment }
      else
        format.js { render :json => format_errors("tasks", @task.errors), :content_type => "application/json", :status => :unprocessable_entity }
        format.html { render :action => :new, :status => :unprocessable_entity }
      end
    end
  end
end