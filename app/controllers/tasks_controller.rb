
class TasksController < ApplicationController
  load_and_authorize_resource :customer
  load_and_authorize_resource :through => :customer
  respond_to :html, :xml, :json
  
  include FormAjaxHelper
  
  def index
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
    respond_to do |format|
      if @task.save
        format.js { render :locals => { :task => @task }, :layout => false, :status => :created }
        format.html { redirect_to @comment } 
      else
        format.js { render :json => format_errors("tasks", @task.errors), :content_type => "application/json", :status => :unprocessable_entity }
        format.html { render :action => :new, :status => :unprocessable_entity }
      end
    end
  end
end