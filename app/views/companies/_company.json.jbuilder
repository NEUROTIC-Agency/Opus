json.extract! company, :id, :name, :subscribed, :plan, :description, :employees_count, :website, :location, :hidden, :currency, :subdomain, :created_at, :updated_at
json.url company_url(company, format: :json)
