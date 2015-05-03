class MasterLeasePdfForm < FillablePdfForm

  def initialize(tenant)
    @tenant = tenant
    super()
  end

  protected

  def fill_out
    [:tenantname, :t_address, :tenantbuildinginfo, :t_email, :t_phone, :propertynumber, :leasestart, :leaseend, :monthrent2, :addterms, :businesstype, :renewterms].each do |field|
      fill field, @tenant.send(field)
    end
  end
end