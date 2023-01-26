require "application_system_test_case"

class RecruitmentCompaniesTest < ApplicationSystemTestCase
  setup do
    @recruitment_company = recruitment_companies(:one)
  end

  test "visiting the index" do
    visit recruitment_companies_url
    assert_selector "h1", text: "Recruitment companies"
  end

  test "should create recruitment company" do
    visit recruitment_companies_url
    click_on "New recruitment company"

    fill_in "Currency", with: @recruitment_company.currency
    fill_in "Description", with: @recruitment_company.description
    fill_in "Employees count", with: @recruitment_company.employees_count
    check "Hidden" if @recruitment_company.hidden
    fill_in "Location", with: @recruitment_company.location
    fill_in "Name", with: @recruitment_company.name
    fill_in "Plan", with: @recruitment_company.plan
    fill_in "Slug", with: @recruitment_company.slug
    check "Subscribed" if @recruitment_company.subscribed
    fill_in "Tenant", with: @recruitment_company.tenant_id
    fill_in "Website", with: @recruitment_company.website
    click_on "Create Recruitment company"

    assert_text "Recruitment company was successfully created"
    click_on "Back"
  end

  test "should update Recruitment company" do
    visit recruitment_company_url(@recruitment_company)
    click_on "Edit this recruitment company", match: :first

    fill_in "Currency", with: @recruitment_company.currency
    fill_in "Description", with: @recruitment_company.description
    fill_in "Employees count", with: @recruitment_company.employees_count
    check "Hidden" if @recruitment_company.hidden
    fill_in "Location", with: @recruitment_company.location
    fill_in "Name", with: @recruitment_company.name
    fill_in "Plan", with: @recruitment_company.plan
    fill_in "Slug", with: @recruitment_company.slug
    check "Subscribed" if @recruitment_company.subscribed
    fill_in "Tenant", with: @recruitment_company.tenant_id
    fill_in "Website", with: @recruitment_company.website
    click_on "Update Recruitment company"

    assert_text "Recruitment company was successfully updated"
    click_on "Back"
  end

  test "should destroy Recruitment company" do
    visit recruitment_company_url(@recruitment_company)
    click_on "Destroy this recruitment company", match: :first

    assert_text "Recruitment company was successfully destroyed"
  end
end
