class HelpsController < ApplicationController
  before_action :set_help, only: [:show, :edit, :update, :destroy]

  # GET /helps
  # GET /helps.json
  def index
    @helps = Help.all
  end

  # GET /helps/1
  # GET /helps/1.json
  def show
    redirect_to action: "index"
  end

  # GET /helps/new
  def new
    redirect_to action: "index"
  end

  # GET /helps/1/edit
  def edit
    redirect_to action: "index"
  end

  def download_master_lease
    send_file(
      "#{Rails.root}/lib/pdf_templates/master_lease.pdf",
      filename: "master_lease.pdf",
      type: "application/pdf"
    )
  end

  def download_master_expense
    send_file(
      "#{Rails.root}/lib/pdf_templates/expense_addendum_master.pdf",
      filename: "expense_addendum_master.pdf",
      type: "application/pdf"
    )
  end

  # POST /helps
  # POST /helps.json
  def create
    redirect_to action: "index"
    # @help = Help.new(help_params)

    # respond_to do |format|
    #   if @help.save
    #     format.html { redirect_to @help, notice: 'Help was successfully created.' }
    #     format.json { render :show, status: :created, location: @help }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @help.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /helps/1
  # PATCH/PUT /helps/1.json
  def update
    @help = Help.find_by_id(1)
    @allbuildings = Building.all
    @allbuildings.each do |b|
      b.gst = @help.gst
      b.qst = @help.qst
      b.save
    end
 
    respond_to do |format|
      if @help.update(help_params)
        format.html { redirect_to @help, notice: 'Help was successfully updated.' }
        format.json { render :show, status: :ok, location: @help }
        #redirect_to action: "index"
      else
        format.html { render :edit }
        format.json { render json: @help.errors, status: :unprocessable_entity }
        #redirect_to action: "index"
      end
    end
  end

  # DELETE /helps/1
  # DELETE /helps/1.json
  def destroy
    # @help.destroy
    # respond_to do |format|
    #   format.html { redirect_to helps_url, notice: 'Help was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    redirect_to action: "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help
      # @help = Help.find(params[:id])
      rescue ActiveRecord::RecordNotFound  
          redirect_to root_url
       return
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_params
      params.require(:help).permit(:gst, :qst)
    end
end
