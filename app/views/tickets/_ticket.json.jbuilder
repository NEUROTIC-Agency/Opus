json.extract! ticket, :id, :body, :company_id, :status, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
