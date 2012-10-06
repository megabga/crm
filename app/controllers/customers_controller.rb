
class CustomersController < ApplicationController
  before_filter :custom_load_creator, :only => :create
  load_and_authorize_resource
  
  autocomplete :business_segment, :name, :full => true
  autocomplete :business_activity, :name, :full => true
  
  def index
    @sels = params["sels"] || []
    @customers = Customer.search(@customers, params[:name]).paginate(page: params[:page], :per_page => 5)
  end
  
  def show
    @task = @customer.tasks.build
    @tasks = @customer.tasks.paginate(page:params[:task_page] || 1, per_page: 3)
    render "show."+@customer.person.prefix
  end
  
  def disable
    
  end
  
  def new
    @person = CustomerPj.new
    @customer.person = @person
    @segments = BusinessSegment.all
    render "new."+preferences_customer_type?.to_s
  end
  
  def create
    if (params[:customer]==nil)
      return
    end
    
    filter_inputs params[:customer] if params[:customer]
    
    @customer = Customer.new(params[:customer])
    @person = CustomerPj.new(params[:customer_pj])
    @customer.person = @person
    
    @person.segments = params[:segments_select] ? params[:segments_select].collect { |bsid| BusinessSegment.find bsid }.uniq : []
    @person.activities = params[:activities_select] ? params[:activities_select].collect { |baid| BusinessActivity.find baid }.uniq : []
    
    if @customer.save
      flash[:success] = t("helpers.forms.new_sucess")
      redirect_to customer_path(@customer)
    else
      authorize! :new, @customer, 'new.'+preferences_customer_type?.to_s
      render 'new.'+preferences_customer_type?.to_s
    end
  end
  
  def update
    
    params_pj = params[:customer][:customer_pj]
    params[:customer].delete :customer_pj
    
    #@customer = Customer.find(params[:id])
    @person = @customer.person
    
    @person.segments = params[:segments_select] ? params[:segments_select].collect { |bsid| BusinessSegment.find bsid }.uniq : []
    @person.activities = params[:activities_select] ? params[:activities_select].collect { |baid| BusinessActivity.find baid }.uniq : []
    
    @person.save
    
    if @customer.update_attributes(params[:customer]) &&
    @person.update_attributes(params_pj)
      
      if @customer.save
        flash[:success] = t("helpers.forms.new_sucess")
        redirect_to customer_path(@customer)
      else
        render 'new.'+preferences_customer_type?.to_s
      end
    end
  end
  
  def edit
    @customer = Customer.find params[:id]
    @person = @customer.person
  end
  
  def filter_inputs(params)
    params[:doc].gsub! /[\.\/-]/, "" if params[:doc] 
  end
  
  
  def multiselect_business_segments
    res = []
    BusinessSegment.all.each {|b| res << {:key => b.id.to_s, :value => b.name} }
    render :json => res
  end
  
  def multiselect_business_activities
    res = []
    BusinessActivity.all.each {|b| res << {:key => b.id.to_s, :value => b.name} }
    render :json => res
  end
  
  def custom_load_creator
    params[:customer_pj] = params[:customer][:customer_pj]
    params[:customer].delete :customer_pj
  end
end
