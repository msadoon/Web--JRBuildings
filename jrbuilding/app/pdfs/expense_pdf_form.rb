class ExpensePdfForm < FillableExpensePdfForm

  def initialize(tenant)
    @tenant = tenant
    super()
  end

  protected

  def fill_out
    [:tenantname, :tenantbuildinginfo, :yearlyincrease, :gst, :qst, :propertynumber, :monthrent2, :pshare, :additionalrent, :monthrentwithtax, :annualquota, :monthlybasis, :gstamount, :qstamount, :nowdate, :additionalmonthly, :year, :yearend, :yeartotal, :cost1, :cost2, :cost3, :cost4, :cost5, :cost6, :cost7, :cost8, :cost9, :cost10, :item1, :item2, :item3, :item4, :item5, :item6, :item7, :item8, :item9, :item10].each do |field|
      fill field, @tenant.send(field)
    end
  end
end