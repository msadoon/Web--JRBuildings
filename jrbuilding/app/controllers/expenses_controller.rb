class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.search(params[:search])
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    redirect_to action: "index"
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  def expenses_for_building
    s = Expense.for_building(params[:buildinginfo]).to_a.map(&:serializable_hash)
    @var = s.map { |x| x["year"]}
    @var2 = s.map { |x| x["yeartotal"] }
#     {"optionValue":10, "optionDisplay": "Remy"},
# {"optionValue":11, "optionDisplay": "Arif"},
# {"optionValue":12, "optionDisplay": "JC"}
    @var3 = Expense.createTag(@var, @var2)
    render text: @var3
  end

  def expensesforyear

    s = Expense.expenses_for_year(params[:year]).to_s('F')
    
    render text: s
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create

    @expense = Expense.new(expense_params)

    b_id = Building.search(@expense.buildinginfo)
    Building.find_by(id: b_id).expenses << @expense
    
    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    @updateTenants = []
    Tenant.all.each do |t|
      if @expense.year == t.expenseyear
        @updateTenants << t
      end
    end

    respond_to do |format|
      if @expense.update(expense_params)
        b_id = Building.search(@expense.buildinginfo)
        Building.find_by(id: b_id).expenses << @expense
        @updateTenants.each do |t|
          t.expenseyear = @expense.year
          t.save
        end
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
      rescue ActiveRecord::RecordNotFound  
          redirect_to root_url
       return
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:item1, :item2, :item3, :item4, :item5, :item6, :item7, :item8, :item9, :item10, :cost1, :cost2, :cost3, :cost4, :cost5, :cost6, :cost7, :cost8, :cost9, :cost10, :year, :yearend, :yeartotal, :buildinginfo)
    end
end
