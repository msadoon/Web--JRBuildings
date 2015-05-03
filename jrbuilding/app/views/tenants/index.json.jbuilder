json.array!(@tenants) do |tenant|
  json.extract! tenant, :id, :buildingnumber, :propertynumber, :businessname, :tenantname, :status, :type, :notes, :postgiven, :posttogive, :renewal, :email, :monthrent, :businesstype, :addterms, :renewterms, :gst, :qst, :monthrentwithtax, :yearrentwithtax, :leasestart, :leaseend, :pshare, :expenseyear, :yearlyincrease, :additionalrent, :monthlyrent
  json.url tenant_url(tenant, format: :json)
end
