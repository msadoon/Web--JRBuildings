class ChequesController < ApplicationController
  before_action :set_cheque, only: [:show, :edit, :update, :destroy]

  # GET /cheques
  # GET /cheques.json
  def index
    @cheque = Cheque.new
    @cheques = Cheque.all
  end

  # GET /cheques/1
  # GET /cheques/1.json
  def show
    redirect_to cheques_url
  end

  # GET /cheques/new
  def new
    redirect_to cheques_url
  end

  # GET /cheques/1/edit
  def edit
    redirect_to cheques_url
  end

  # POST /cheques
  # POST /cheques.json
  def create
    @cheque = Cheque.new(cheque_params)
    @cheque.save
    render :nothing => true
    #respond_to do |format|
      #if 
        #format.html { redirect_to @cheque, notice: 'Cheque was successfully created.' }
        #format.json { render '#', status: :created, location: @cheque }
      #else
        #format.html { render '#' }
        #format.json { render json: @cheque.errors, status: :unprocessable_entity }
      #end
    #end
  end

  def single_report
       f = SingleTenantChequeReport.create(Tenant.where("tenantname = ?", params[:tenant]))
       send_file f, :filename => "single_tenant_cheque_report.pdf", :type => "application/pdf"
  end

  def all_report
       f = AllTenantChequeReport.create(Tenant.where("tenantname = ?", params[:tenant]))
       send_file f, :filename => "all_tenant_cheque_report.pdf", :type => "application/pdf"
  end

  # PATCH/PUT /cheques/1
  # PATCH/PUT /cheques/1.json
  def update
    respond_to do |format|
      if @cheque.update(cheque_params)
        format.html { redirect_to @cheque, notice: 'Cheque was successfully updated.' }
        format.json { render :show, status: :ok, location: @cheque }
      else
        format.html { render :edit }
        format.json { render json: @cheque.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /cheques/1
  # DELETE /cheques/1.json
  def destroy
    @cheque.destroy
    d { 'cheque deleted' }
    render :nothing => true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheque
      @cheque = Cheque.find(params[:id])
      rescue ActiveRecord::RecordNotFound  
          redirect_to root_url
       return
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheque_params
      params.require(:cheque).permit(:amount,:postdate, :tenant_id)
    end
end
