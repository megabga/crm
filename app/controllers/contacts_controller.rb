class ContactsController < ApplicationController
  # GET customers/1/contacts
  # GET customers/1/contacts.json
  def index
    @customers = Customer.find(params[:customer_id])
    @contacts = @customers.contacts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @contacts }
    end
  end

  # GET customers/1/contacts/1
  # GET customers/1/contacts/1.json
  def show
    @customers = Customer.find(params[:customer_id])
    @contact = @customers.contacts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @contact }
    end
  end

  # GET customers/1/contacts/new
  # GET customers/1/contacts/new.json
  def new
    @customers = Customer.find(params[:customer_id])
    @contact = @customers.contacts.build

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

  # POST customers/1/contacts
  # POST customers/1/contacts.json
  def create
    @customers = Customer.find(params[:customer_id])
    @contact = @customers.contacts.build(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to([@contact.customers, @contact], :notice => 'Contact was successfully created.') }
        format.json { render :json => @contact, :status => :created, :location => [@contact.customers, @contact] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT customers/1/contacts/1
  # PUT customers/1/contacts/1.json
  def update
    @customers = Customer.find(params[:customer_id])
    @contact = @customers.contacts.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to([@contact.customers, @contact], :notice => 'Contact was successfully updated.') }
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
    @customers = Customer.find(params[:customer_id])
    @contact = @customers.contacts.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to customers_contacts_url(customers) }
      format.json { head :ok }
    end
  end
end
