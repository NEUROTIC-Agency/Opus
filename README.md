# README

### Row-level multitenancy managed by [ActsAsTenant](https://github.com/ErwinM/acts_as_tenant)
- Each recruitment company (Company) has a subdomain (mandatory value upon creation)
- All the models except the Admin model must belong to a Company, all related records are compartmentalized via their company_id
- Belongs to association is handled by the acts_as_tenant(:company) method on each model
- Therefre all the resources are only accesible via the company's subdomain
- Subdomains can be accessed locally lvh.me. Ex: http://subdomain.lvh.me:3000/jobs
- For lvh to work locally, config hosts must disabled in application.rb : `config.hosts = nil`
- ActsAsTenant.current_tenant is definied in ApplicationController with `set_current_tenant_by_subdomain(:company, :subdomain)`

### To do
- [x] Draw Database schema, key values per model and tables relations
- [x] Set up Rails app with Postgresql & Tailwind built-in
- [x] Implement basic scaffolding and data validation
- [x] Prepare seeds with Faker
- [x] Implement multitenancy and subdomain data separation with ActsAsTenant
- [ ] Deploy to Heroku to make sure multitenancy and subdomains work in the production environment
- [ ] Scope resources for each Devise user and restrict their access
- [ ] Create CRUD actions for Devise models
- [ ] Create basic Navbar to facilitate navigation
- [ ] Create signup form to generate new leads
- [ ] Set action scopes for each user
- [ ] Create admin pannel for Admins (using gem or coding it)
- [ ] Implement testing
- [ ] Implement search on all resources
- [ ] Create mailers
- [ ] Test for N+1 queries
- [ ] Install ViewComponent and Lookbook
- [ ] Implement High Fidelity frontend on all the pages related to models
- [ ] Implement High Fidelity frontend on marketing pages (content needed)
- [ ] Work on Turbo actions
- [ ] Implement basic frontend for Companies that won't be using a pluggable website
