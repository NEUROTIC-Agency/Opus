json.extract! job, :id, :title, :salary, :employment_type, :location, :role_description, :requirements, :benefits, :interview_process, :contact, :expiry_date, :status, :searchable, :company_id, :recruiter_id, :created_at, :updated_at
json.url job_url(job, format: :json)
