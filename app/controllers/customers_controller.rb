
class CustomersController < ApplicationController
  autocomplete :business_segment, :name, :full => true
  autocomplete :business_activity, :name, :full => true
    
  def index
    @sels = params["sels"] || []
    @customers = Customer.search params[:name]
  end
  
  def show
    @customer  = Customer.find params[:id]
    render "show."+@customer.person.prefix
  end
  
  def disable
    
  end
  
  def new
    @customer = Customer.new
    @person = CustomerPj.new
    @customer.person = @person
    @segments = BusinessSegment.all
    #@customer.person.customer_segments.build
    @customer.person.segments.build
    @customer.person.activities.build
    render "new."+preferences_customer_type?.to_s
  end
  
  def create
    filter_inputs params[:customer]
    
    params_pj = params[:customer][:customer_pj]
    params[:customer].delete :customer_pj
    
    
    @customer = Customer.new(params[:customer])
    @person = CustomerPj.new(params_pj)
    @customer.person = @person
    
    debugger
    
    @person.segments = params[:segments_select] ? params[:segments_select].collect { |bsid| BusinessSegment.find bsid } : []
    @person.activities = params[:activities_select] ? params[:activities_select].collect { |baid| BusinessActivity.find baid } : []
    
    if @customer.save
      flash[:success] = t("helpers.forms.new_sucess")
      redirect_to customer_path(@customer)
    else
      render 'new.'+preferences_customer_type?.to_s
    end
  end
  
  def filter_inputs(params)
    params[:doc].gsub! /[\.\/-]/, ""
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
end
