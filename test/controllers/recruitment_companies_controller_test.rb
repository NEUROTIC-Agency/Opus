require "test_helper"

class RecruitmentCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recruitment_company = recruitment_companies(:one)
  end

  test "should get index" do
    get recruitment_companies_url
    assert_response :success
  end

  test "should get new" do
    get new_recruitment_company_url
    assert_response :success
  end

  test "should create recruitment_company" do
    assert_difference("RecruitmentCompany.count") do
      post recruitment_companies_url, params: { recruitment_company: { currency: @recruitment_company.currency, description: @recruitment_company.description, employees_count: @recruitment_company.employees_count, hidden: @recruitment_company.hidden, location: @recruitment_company.location, name: @recruitment_company.name, plan: @recruitment_company.plan, slug: @recruitment_company.slug, subscribed: @recruitment_company.subscribed, tenant_id: @recruitment_company.tenant_id, website: @recruitment_company.website } }
    end

    assert_redirected_to recruitment_company_url(RecruitmentCompany.last)
  end

  test "should show recruitment_company" do
    get recruitment_company_url(@recruitment_company)
    assert_response :success
  end

  test "should get edit" do
    get edit_recruitment_company_url(@recruitment_company)
    assert_response :success
  end

  test "should update recruitment_company" do
    patch recruitment_company_url(@recruitment_company), params: { recruitment_company: { currency: @recruitment_company.currency, description: @recruitment_company.description, employees_count: @recruitment_company.employees_count, hidden: @recruitment_company.hidden, location: @recruitment_company.location, name: @recruitment_company.name, plan: @recruitment_company.plan, slug: @recruitment_company.slug, subscribed: @recruitment_company.subscribed, tenant_id: @recruitment_company.tenant_id, website: @recruitment_company.website } }
    assert_redirected_to recruitment_company_url(@recruitment_company)
  end

  test "should destroy recruitment_company" do
    assert_difference("RecruitmentCompany.count", -1) do
      delete recruitment_company_url(@recruitment_company)
    end

    assert_redirected_to recruitment_companies_url
  end
end
