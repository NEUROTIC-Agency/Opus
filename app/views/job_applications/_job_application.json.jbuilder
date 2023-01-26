json.extract! job_application, :id, :status, :seen, :dealt_with, :job_id, :candidate_id, :recruitment_company_id, :tenant_id, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)
