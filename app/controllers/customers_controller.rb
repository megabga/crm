
class CustomersController < ApplicationController
  
  autocomplete :business_segment, :name, :full => true
  autocomplete :business_activity, :name, :full => true
  
  def index
    @customers = Customer.all
  end
  
  def show
  end
  
  def disable
  end
  
  def new
    @customer = Customer.new
    @person = CustomerPj.new
    @segments = BusinessSegment.all
    @customer.person = @person
    @customer.person.customer_segments.build
    @customer.person.activities.build
    render "new."+preferences_customer_type?.to_s
  end
  
  def create
    @customer = User.new(params[:customer])
    if @customer.save
      flash[:success] = t("helpers.forms.new_sucess")
      redirect_to show_custumer_path(@customer)
    else
      render 'new.'+preferences_customer_type?.to_s
    end
  end
end
