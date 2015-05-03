class TenantsController < ApplicationController

  before_action :set_tenant, only: [:show, :edit, :update, :destroy]


  # GET /tenants
  # GET /tenants.json
  def index
    @tenants = Tenant.search(params[:search])
  end

  # GET /tenants/1
  # GET /tenants/1.json
  def show
    redirect_to action: "index"
  end

  # GET /tenants/new
  def new
    @tenant = Tenant.new
  end

  def edit

  end

  def get_tenant_id
    s = Tenant.where("tenantname = ?", params[:tname]).first
    render text: s.id.to_s
  end

  def get_tenant_table
    s = Tenant.where("tenantname = ?", params[:tname]).first
    @cheques = s.cheques.sort { |a,b| a.postdate <=> b.postdate }
    @message = ""
    @thisparticularcheque = []
    @cheques.each do |c|
            @thisparticularcheque << c.postdate.day
            @thisparticularcheque << Date::ABBR_MONTHNAMES[c.postdate.month]
            @thisparticularcheque << c.postdate.year
            @thisparticularcheque << ActionController::Base.helpers.number_with_precision(c.amount, precision: 2) 
            @thisparticularcheque << c.id
            @message += "<tr><td>" + @thisparticularcheque[0].to_s + " " + @thisparticularcheque[1].to_s + " " + @thisparticularcheque[2].to_s + "</td><td>" + @thisparticularcheque[3].to_s + "</td><td><a href=\"\/cheques\/" + @thisparticularcheque[4].to_s + "\" data-method=\"delete\" id=\"cheque_delete\" data-remote=\"true\" class=\"btn btn-danger\" rel=\"nofollow\">Delete</a></td></tr>"
            @thisparticularcheque = []
    end


    render text: @message
  end

  def tenants_in_local
      @alltenants = Tenant.all
      @full = false
      @tenantsinlocal = []
      @message = ""
      @mr = ""
      @thisparticulartenant = []
      @alltenants.each do |t|
        
         #d { t.propertynumber }
        
         #d { t.tenantbuildinginfo }
        if ((t.propertynumber == params[:pnum].to_i) && (t.tenantbuildinginfo == params[:bnum]))
          @thisparticulartenant << t.tenantname
          @thisparticulartenant << t.leasestart
          @thisparticulartenant << t.leaseend
          @thisparticulartenant << t.monthrent2
          
          @tenantsinlocal << @thisparticulartenant
          @thisparticulartenant = []
          @full = true
          
        else
          # do nothing
        end
      end
      # d { @full }
      if (@full == true)
        # d { 'executes true' }
        # d { @tenantsinlocal }
        # d { @tenantsinlocal.count }
        @message = "This local has " + @tenantsinlocal.count.to_s + " tenant(s), "
        # d { 'after set message ' }

        @tenantsinlocal.each do |m|

            if (m[3].to_s == "")
              @mr = "0.00"
            else 
              @mr = m[3].to_s
            end
            @message += "\n\n" + m[0].to_s + " with a lease start of " + m[1].to_s + ", lease end of " + m[2].to_s + " and monthly rent of " + @mr.to_s
        end
        @message += "\n\n" + "Are you sure you want to save at this local? (No tenants will be overwritten, but you'll have more than one tenant at this local)"
        
      else
        @message = "No tenants in this local, ok to save here!"
        
      end
   
      render text: @message
  end

  def generate_lease(tenant)
       tenant = Tenant.find_by_id(tenant)
       send_file MasterLeasePdfForm.new(tenant).export(nil, tenant.tenantname, current_user), type: 'application/pdf'
  end

  def expense_addendum(tenant)
      # pdf = ExpenseAdd.create(tenant)
      tenant = Tenant.find_by_id(tenant)
      send_file ExpensePdfForm.new(tenant).export(nil, tenant.tenantname, current_user), type: 'application/pdf'
  end

  def send_mail
    UserMailer.reminder_email(params[:tname], params[:temail], params[:tleaseend]).deliver
    redirect_to :back
  end

  # POST /tenants
  # POST /tenants.json
  def create
    @tenant = Tenant.new(tenant_params)
    
    p_id = Property.searchSecond(@tenant.tenantbuildinginfo)
    Property.find_by(id: p_id).tenants << @tenant
    respond_to do |format|
      if @tenant.save
        # if (@tenant.renewal == true)
        #   UserMailer.delay(run_at: @tenant.leaseend - 3.months).reminder_email(@tenant)
        # end
        format.html { redirect_to @tenant, notice: 'Tenant was successfully created.' }
        format.json { render :show, status: :created, location: @tenant }
      else
        format.html { render :new }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /tenants/1
  # PATCH/PUT /tenants/1.json
  def update

    respond_to do |format|
      if @tenant.update(tenant_params)
        p_id = Property.searchSecond(@tenant.tenantbuildinginfo)
        Property.find_by(id: p_id).tenants << @tenant
        format.html { redirect_to @tenant, notice: 'Tenant was successfully updated.' }
        format.json { render :show, status: :ok, location: @tenant }
      else
        format.html { render :edit }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end

    if  params[:generate_lease]
      generate_lease(@tenant)
    elsif params[:expense_add]
      expense_addendum(@tenant)
    else
      #do nothing
    end

  end

  # DELETE /tenants/1
  # DELETE /tenants/1.json
  def destroy
    @tenant.destroy
    respond_to do |format|
      format.html { redirect_to tenants_url, notice: 'Tenant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant = Tenant.find(params[:id])
      rescue ActiveRecord::RecordNotFound  
          redirect_to root_url
       return
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tenant_params
      params.require(:tenant).permit(:tenantbuildinginfo, :propertynumber, :tenantname, :ltype, :postgiven, :posttogive, :renewal, :t_address, :t_phone, :t_email, :monthrent, :businesstype, :addterms, :renewterms, :gst, :qst, :monthrentwithtax, :yearrentwithtax, :leasestart, :leaseend, :pshare, :expenseyear, :expenseforyear, :yearlyincrease, :additionalrent, :monthlyrent)
    end
end
