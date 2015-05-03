require 'test_helper'

class TenantsControllerTest < ActionController::TestCase
  setup do
    @tenant = tenants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tenant" do
    assert_difference('Tenant.count') do
      post :create, tenant: { additionalrent: @tenant.additionalrent, addterms: @tenant.addterms, buildingnumber: @tenant.buildingnumber, businessname: @tenant.businessname, businesstype: @tenant.businesstype, email: @tenant.email, expenseyear: @tenant.expenseyear, gst: @tenant.gst, leaseend: @tenant.leaseend, leasestart: @tenant.leasestart, monthlyrent: @tenant.monthlyrent, monthrent: @tenant.monthrent, monthrentwithtax: @tenant.monthrentwithtax, notes: @tenant.notes, postgiven: @tenant.postgiven, posttogive: @tenant.posttogive, propertynumber: @tenant.propertynumber, pshare: @tenant.pshare, qst: @tenant.qst, renewal: @tenant.renewal, renewterms: @tenant.renewterms, status: @tenant.status, tenantname: @tenant.tenantname, type: @tenant.type, yearlyincrease: @tenant.yearlyincrease, yearrentwithtax: @tenant.yearrentwithtax }
    end

    assert_redirected_to tenant_path(assigns(:tenant))
  end

  test "should show tenant" do
    get :show, id: @tenant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tenant
    assert_response :success
  end

  test "should update tenant" do
    patch :update, id: @tenant, tenant: { additionalrent: @tenant.additionalrent, addterms: @tenant.addterms, buildingnumber: @tenant.buildingnumber, businessname: @tenant.businessname, businesstype: @tenant.businesstype, email: @tenant.email, expenseyear: @tenant.expenseyear, gst: @tenant.gst, leaseend: @tenant.leaseend, leasestart: @tenant.leasestart, monthlyrent: @tenant.monthlyrent, monthrent: @tenant.monthrent, monthrentwithtax: @tenant.monthrentwithtax, notes: @tenant.notes, postgiven: @tenant.postgiven, posttogive: @tenant.posttogive, propertynumber: @tenant.propertynumber, pshare: @tenant.pshare, qst: @tenant.qst, renewal: @tenant.renewal, renewterms: @tenant.renewterms, status: @tenant.status, tenantname: @tenant.tenantname, type: @tenant.type, yearlyincrease: @tenant.yearlyincrease, yearrentwithtax: @tenant.yearrentwithtax }
    assert_redirected_to tenant_path(assigns(:tenant))
  end

  test "should destroy tenant" do
    assert_difference('Tenant.count', -1) do
      delete :destroy, id: @tenant
    end

    assert_redirected_to tenants_path
  end
end
