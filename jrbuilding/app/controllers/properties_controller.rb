class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  # GET /properties
  # GET /properties.json
  def index
    # @properties = Property.filter_by_building(params[:buildingnumber])
    # @building = Building.find(params[:building_id])
    @properties = Property.search(params[:search])
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    redirect_to action: "index"
  end


  # GET /properties/new
  def new
    @property = Property.new
    authorize! :create, @property
  end

  # GET /properties/1/edit
  def edit
    authorize! :update, @property
  end


  def create
    @property = Property.new(property_params)
    b_id = Building.search(@property.buildinginfo)
    Building.find_by(id: b_id).properties << @property
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @updateTenants = []
    Tenant.all.each do |t|
      if @property.number == t.propertynumber
        @updateTenants << t
      end
    end

    respond_to do |format|
      if @property.update(property_params)
        b_id = Building.search(@property.buildinginfo)
        Building.find_by(id: b_id).properties << @property
        @updateTenants.each do |t|
          t.propertynumber = @property.number
          t.save
        end
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
      rescue ActiveRecord::RecordNotFound  
          redirect_to root_url
       return
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:number, :buildinginfo, :building_id, :suitedfor, :notes, :rented, :avatar)
    end
end
