require "application_system_test_case"

class JobApplicationsTest < ApplicationSystemTestCase
  setup do
    @job_application = job_applications(:one)
  end

  test "visiting the index" do
    visit job_applications_url
    assert_selector "h1", text: "Job applications"
  end

  test "should create job application" do
    visit job_applications_url
    click_on "New job application"

    fill_in "Candidate", with: @job_application.candidate_id
    check "Dealt with" if @job_application.dealt_with
    fill_in "Job", with: @job_application.job_id
    fill_in "Company", with: @job_application.company_id
    check "Seen" if @job_application.seen
    fill_in "Status", with: @job_application.status
    fill_in "Tenant", with: @job_application.tenant_id
    click_on "Create Job application"

    assert_text "Job application was successfully created"
    click_on "Back"
  end

  test "should update Job application" do
    visit job_application_url(@job_application)
    click_on "Edit this job application", match: :first

    fill_in "Candidate", with: @job_application.candidate_id
    check "Dealt with" if @job_application.dealt_with
    fill_in "Job", with: @job_application.job_id
    fill_in "Company", with: @job_application.company_id
    check "Seen" if @job_application.seen
    fill_in "Status", with: @job_application.status
    fill_in "Tenant", with: @job_application.tenant_id
    click_on "Update Job application"

    assert_text "Job application was successfully updated"
    click_on "Back"
  end

  test "should destroy Job application" do
    visit job_application_url(@job_application)
    click_on "Destroy this job application", match: :first

    assert_text "Job application was successfully destroyed"
  end
end
