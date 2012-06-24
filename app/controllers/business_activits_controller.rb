
class BusinessActivitsController < ApplicationController
  # GET /business_activits
  # GET /business_activits.json
  def index
    @business_activits = BusinessActivit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @business_activits }
    end
  end

  # GET /business_activits/1
  # GET /business_activits/1.json
  def show
    @business_activit = BusinessActivit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_activit }
    end
  end

  # GET /business_activits/new
  # GET /business_activits/new.json
  def new
    @business_activit = BusinessActivit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_activit }
    end
  end

  # GET /business_activits/1/edit
  def edit
    @business_activit = BusinessActivit.find(params[:id])
  end

  # POST /business_activits
  # POST /business_activits.json
  def create
    @business_activit = BusinessActivit.new(params[:business_activit])

    respond_to do |format|
      if @business_activit.save
        format.html { redirect_to @business_activit, notice: 'Business activit was successfully created.' }
        format.json { render json: @business_activit, status: :created, location: @business_activit }
      else
        format.html { render action: "new" }
        format.json { render json: @business_activit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_activits/1
  # PUT /business_activits/1.json
  def update
    @business_activit = BusinessActivit.find(params[:id])

    respond_to do |format|
      if @business_activit.update_attributes(params[:business_activit])
        format.html { redirect_to @business_activit, notice: 'Business activit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_activit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_activits/1
  # DELETE /business_activits/1.json
  def destroy
    @business_activit = BusinessActivit.find(params[:id])
    @business_activit.destroy

    respond_to do |format|
      format.html { redirect_to business_activits_url }
      format.json { head :no_content }
    end
  end
end
