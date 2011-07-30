class PostcodesController < ApplicationController
  # GET /postcodes
  # GET /postcodes.xml
  def index
    @postcodes = Postcode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @postcodes }
    end
  end

  # GET /postcodes/1
  # GET /postcodes/1.xml
  def show
    @postcode = Postcode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @postcode }
    end
  end

  # GET /postcodes/new
  # GET /postcodes/new.xml
  def new
    @postcode = Postcode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @postcode }
    end
  end

  # GET /postcodes/1/edit
  def edit
    @postcode = Postcode.find(params[:id])
  end

  # POST /postcodes
  # POST /postcodes.xml
  def create
    @postcode = Postcode.new(params[:postcode])

    respond_to do |format|
      if @postcode.save
        format.html { redirect_to(@postcode, :notice => 'Postcode was successfully created.') }
        format.xml  { render :xml => @postcode, :status => :created, :location => @postcode }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @postcode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /postcodes/1
  # PUT /postcodes/1.xml
  def update
    @postcode = Postcode.find(params[:id])

    respond_to do |format|
      if @postcode.update_attributes(params[:postcode])
        format.html { redirect_to(@postcode, :notice => 'Postcode was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @postcode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /postcodes/1
  # DELETE /postcodes/1.xml
  def destroy
    @postcode = Postcode.find(params[:id])
    @postcode.destroy

    respond_to do |format|
      format.html { redirect_to(postcodes_url) }
      format.xml  { head :ok }
    end
  end
end
