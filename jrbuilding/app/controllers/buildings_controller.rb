class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  # GET /buildings
  # GET /buildings.json
  def index
    if params[:search].present?
      @buildings = Building.near(params[:search], 50, :order => :distance)
    else
      @buildings = Building.all
    end

  end

  def getgst
    s = Building.get_gst_for_building(params[:buildinginfo])
    @var = s.to_s('F').gsub( /\A"/m, "" ).gsub( /"\Z/m, "" )

    render text: @var 

  end

  def getqst
    s = Building.get_qst_for_building(params[:buildinginfo])
    @var = s.to_s('F').gsub( /\A"/m, "" ).gsub( /"\Z/m, "" )

    render text: @var 

  end

  def properties_for_building
    s = Property.search(params[:buildinginfo]).to_a.map(&:serializable_hash)
    @var = s.map { |x| x["number"]}
    @var2 = s.map { |x| x["number"] }
  
# {"optionValue":10, "optionDisplay": "Remy"},
# {"optionValue":11, "optionDisplay": "Arif"},
# {"optionValue":12, "optionDisplay": "JC"}
    @var3 = Property.createTag(@var, @var2)

    render text: @var3
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
    redirect_to action: "index"
  end

  # GET /buildings/new
  def new
    @building = Building.new
    authorize! :create, @building
  end

  # GET /buildings/1/edit
  def edit
    authorize! :update, @building
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Building was successfully created.' }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    @updateProperties = []
    Property.all.each do |p|
      if @building.half_address == p.buildinginfo
        @updateProperties << p
      end
    end
    @updateTenants = []
    Tenant.all.each do |t|
      if @building.half_address == t.tenantbuildinginfo
        @updateTenants << t
      end
    end
    @updateExpenses = []
    Expense.all.each do |e|
      if @building.half_address == e.buildinginfo
        @updateExpenses << e
      end
    end

    respond_to do |format|
      if @building.update(building_params)
        @updateProperties.each do |p|
          p.buildinginfo = @building.half_address
          p.save
        end
        @updateTenants.each do |t|
          t.tenantbuildinginfo = @building.half_address
          t.save
        end
        @updateExpenses.each do |e|
          e.buildinginfo = @building.half_address
          e.save
        end
        format.html { redirect_to @building, notice: 'Building was successfully updated.' }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: 'Building was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
      rescue ActiveRecord::RecordNotFound  
          redirect_to root_url
       return
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_params
      params.require(:building).permit(:streetname, :streetno, :postalcode, :avatar, :search, :gst, :qst)
    end
end
