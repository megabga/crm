
class TasksController < ApplicationController
  load_and_authorize_resource :customer
  load_and_authorize_resource :through => :customer
  respond_to :html, :xml, :json
  
  include FormAjaxHelper
  
  def index
    respond_to do |format|
      format.json do
         @content = render_to_string( :template => "tasks/_list", :locals => { items: @customer.tasks }, :formats => :html, :layout => false)
         #render :json => { html: @content }, :content_type => "application/json"
         render :json => @content, :content_type => "application/json"
      end
      format.js { head :no_content }
      format.html #
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def new
  end
  
  def create
    @task = @customer.tasks.build(params[:task])
    
    @task.status = SystemTaskStatus.OPENED
    @task.user = current_user
    
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