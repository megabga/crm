class ContactsController < ApplicationController
  load_and_authorize_resource :customer
  load_and_authorize_resource :through => :customer
  
=begin
  # GET customers/1/contacts
  # GET customers/1/contacts.json
  def index
    #@customer = Customer.find(params[:customer_id])
    #@contacts = @customer.contacts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @contacts }
    end
  end

  # GET customers/1/contacts/1
  # GET customers/1/contacts/1.json
  def show
    @customer = Customer.find(params[:customer_id])
    @contact = @customer.contacts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @contact }
    end
  end

  # GET customers/1/contacts/new
  # GET customers/1/contacts/new.json
  def new
    @customer = Customer.find(params[:customer_id])
    @contact = @customer.contacts.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @contact }
    end
  end

  # GET customers/1/contacts/1/edit
  def edit
    @customers = Customer.find(params[:customer_id])
    @contact = @customers.contacts.find(params[:id])
  end
  
=end

  # POST customers/1/contacts
  # POST customers/1/contacts.json
  def create
    @customer = Customer.find(params[:customer_id])
    @contact = @customer.contacts.build(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to([@contact.customer, @contact], :notice => 'Contact was successfully created.') }
        format.json { render :json => @contact, :status => :created, :location => [@contact.customer, @contact] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT customers/1/contacts/1
  # PUT customers/1/contacts/1.json
  def update
    @customer = Customer.find(params[:customer_id])
    @contact = @customer.contacts.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to([@contact.customer, @contact], :notice => 'Contact was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE customers/1/contacts/1
  # DELETE customers/1/contacts/1.json
  def destroy
    @customer = Customer.find(params[:customer_id])
    @contact = @customer.contacts.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to customer_contacts_url(customer) }
      format.json { head :ok }
    end
  end

end
