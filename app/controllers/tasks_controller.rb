
class TasksController < ApplicationController
  load_and_authorize_resource :customer
  load_and_authorize_resource :through => :customer
  respond_to :html, :xml, :json
  
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
        respond_with do |format|
          format.html do
            if request.xhr?
              render :partial => "tasks/show", :locals => { :comment => @task }, :layout => false, :status => :created
            else
              redirect_to @comment
            end
          end
        end
      else
        respond_with do |format|
          format.html do
            if request.xhr?
              puts "ERros in json - "+@task.errors.to_json
              #.map {|v| v[1].force_encoding('UTF-8'); v }
              #render :json => @task.errors, :content_type => "application/json" #, :status => :unprocessable_entity
              render :json => "aabb"# , :status => :unprocessable_entity
            else
              render :action => :new, :status => :unprocessable_entity
            end
          end
        end
      end
    end
  end
end