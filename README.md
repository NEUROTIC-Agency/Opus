## OpusAdmin

### Current progress
![](https://geps.dev/progress/20)

### Running the project
- Make sure that you have `Ruby v.3.0.0` and Rails `7.0.4.2` installed
- Clone repository
```
$ git clone git https://github.com/godiaz/opus.git
```
- Run `bundle install` and `rails db:setup`
- Now you can launch the rails server locally with the command `bin/dev` **(not rails s because we need the Procfile to run Tailwind)**
- Go to [localhost:3000](http://localhost:3000/)

### Row-level multitenancy managed by [ActsAsTenant](https://github.com/ErwinM/acts_as_tenant)
- Each recruitment company (Company) has a subdomain (mandatory value upon creation)
- All the models except the Admin model must belong to a Company, all related records are compartmentalized via their company_id
- Belongs to association is handled by the acts_as_tenant(:company) method on each model
- Therefore all the resources are only accesible via the company's subdomain
- Subdomains can be accessed locally lvh.me. Ex: http://subdomain.lvh.me:3000/jobs **(very important: you will have to replace _subdomain_ value with an existing one, and be careful, this not a normal localhost)**
- For lvh to work locally, config hosts must disabled in application.rb : `config.hosts = nil`
- ActsAsTenant.current_tenant is defined in ApplicationController with `set_current_tenant_by_subdomain(:company, :subdomain)`
- When a subdomain is detected, the tenant will be set and this scopes all the searches
```ruby
# When hitting the subdomain of Company.find(3) the following searches will only return objects
# where company_id == 3
Recruiter.all # => all recruiters with company_id => 3
Recruiter.notes.all #  => all notes with company_id => 3
```

### To do
- [x] Draw [Database schema](https://www.figma.com/file/rykj86L6cf3ApFiafoaq5g/Untitled?node-id=0%3A1&t=MG46fFBny3rAfZP6-1), key values per model and tables relations
- [x] Set up Rails app with Postgresql & Tailwind built-in
- [x] Implement basic scaffolding and data validation
- [x] Prepare seeds with Faker
- [x] Implement multitenancy and subdomain data separation with ActsAsTenant
- [x] Create general index with all available resources scoped by subdomain to easily manipulate data and test actions
- [ ] Scope routes for each Devise user and restrict their access.
  - Logged Admins can CRUD everything
  - Logged Recruiters can CRUD their profile, Jobs, Notes, Tickets, RU job_applications, R candidates, RUD their company
  - Logged Candidates can CRUD their profile, CRU job_applications, R jobs
  - Unlogged users get access to nothing except marketing pages and Jobs
  - rootpath (http://localhost:3000/) should serve no company related resource unless Admin is logged in
- [ ] Add ActsAsParanoid gem
- [ ] Deploy to Heroku to make sure multitenancy and subdomains work in the production environment
- [ ] Add Categories and Subcategories for Companies (not sure how we'll use them)
- [ ] Update Devise views with missing params
- [ ] Create basic Navbar to facilitate navigation
- [ ] Create signup form to generate new leads (it should automatically create a new Company on a free plan with a main Recruiter admin)
- [ ] Set action resctrictions for the other Recruiters (maybe with Rollify) for
- [ ] Create admin pannel for Admins (using gem or coding it)
- [ ] Implement testing
- [ ] Implement search on all resources
- [ ] Create mailers
- [ ] Test for N+1 queries
- [ ] Implement basic analytics
- [ ] Install ViewComponent and Lookbook
- [ ] Implement High Fidelity frontend on all the pages related to models
- [ ] Implement High Fidelity frontend on marketing pages (content needed)
- [ ] Work on Turbo actions
- [ ] Implement basic frontend for Companies that won't be using a pluggable website (background_color, font_color, font_type?)
- [ ] Implement payment system

### Deploying to Heroku
- Once you have full acess to Heroku, you need to configure a staging remote to be able to push code into it:
```
$ heroku create --remote opus-staging
```
- Always deploy first into the staging `git push heroku main --app=opus-staging`.
- Once your changes are validated in the staging, deploy to master `git push heroku main --app=opus`.
- You can find more info on heroku page: https://devcenter.heroku.com/articles/git
