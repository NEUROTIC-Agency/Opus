require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "should create job" do
    visit jobs_url
    click_on "New job"

    fill_in "Benefits", with: @job.benefits
    fill_in "Contact", with: @job.contact
    fill_in "Employment type", with: @job.employment_type
    fill_in "Expiry date", with: @job.expiry_date
    fill_in "Interview process", with: @job.interview_process
    fill_in "Location", with: @job.location
    fill_in "Recruiter", with: @job.recruiter_id
    fill_in "Recruitment company", with: @job.recruitment_company_id
    fill_in "Requirements", with: @job.requirements
    fill_in "Role description", with: @job.role_description
    fill_in "Salary", with: @job.salary
    check "Searchable" if @job.searchable
    fill_in "Status", with: @job.status
    fill_in "Tenant", with: @job.tenant_id
    fill_in "Title", with: @job.title
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "should update Job" do
    visit job_url(@job)
    click_on "Edit this job", match: :first

    fill_in "Benefits", with: @job.benefits
    fill_in "Contact", with: @job.contact
    fill_in "Employment type", with: @job.employment_type
    fill_in "Expiry date", with: @job.expiry_date
    fill_in "Interview process", with: @job.interview_process
    fill_in "Location", with: @job.location
    fill_in "Recruiter", with: @job.recruiter_id
    fill_in "Recruitment company", with: @job.recruitment_company_id
    fill_in "Requirements", with: @job.requirements
    fill_in "Role description", with: @job.role_description
    fill_in "Salary", with: @job.salary
    check "Searchable" if @job.searchable
    fill_in "Status", with: @job.status
    fill_in "Tenant", with: @job.tenant_id
    fill_in "Title", with: @job.title
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "should destroy Job" do
    visit job_url(@job)
    click_on "Destroy this job", match: :first

    assert_text "Job was successfully destroyed"
  end
end
