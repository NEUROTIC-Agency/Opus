# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "destroying data..."
Company.destroy_all
Recruiter.destroy_all
Candidate.destroy_all
Job.destroy_all
puts "Seeds clean"
puts "Starting new seeds"
puts "=> Creating Companies, wait..."

5.times do
  company = Company.new
  company.name = Faker::Company.name
  company.location = Faker::Address.city
  company.website = w = Faker::Internet.domain_name
  company.description = Faker::Lorem.paragraphs(number: 4).join(' ')
  company.employees_count = ['0-50', '51-200','201-500', '+500'].sample
  company.subscribed = true
  image = URI.parse(Faker::Company.logo).open
  company.avatar.attach(io: image, filename: "avatar.png" , content_type: "image/png")
  company.hidden = false
  company.currency = ['Sterling', 'Euro', 'US Dollar'].sample
  company.subdomain = company.name.parameterize
  company.is_dummy = true
  company.save
  if company.errors.any?
    puts "#{company.errors.inspect}"
    break
  end
end

puts "#{Company.count} companies created"

puts "=> Creating Recruiters, wait..."

Company.all.each do |rc|
  rand(1..4).times do
    r = Recruiter.new
    image = URI.parse("https://api.lorem.space/image/face?w=256&h=256").open
    r.avatar.attach(io: image, filename: "avatar.png" , content_type: "image/png")
    r.email = Faker::Internet.free_email
    r.first_name = Faker::Name.first_name
    r.last_name = Faker::Name.last_name
    r.role = ["Admin", "Member"].sample
    r.company = rc
    r.password = pw = Faker::Internet.password
    r.password_confirmation = pw
    r.save
  end
end

puts "#{Recruiter.all.count} recruiters created"

puts "=> Creating loggable recruiter profile, wait..."

mi6 = Company.create(name: 'MI6', description:'Military Intelligence, section 6', location: 'London', employees_count: '+500', currency: 'Sterling', website: 'mi6.com', subscribed: true, hidden: false, subdomain:'mi6')

jb = Recruiter.new
jb.first_name = 'James'
jb.last_name = 'Bond'
jb.email = 'james@bond.com'
jb.password = 'james@bond.com'
jb.password_confirmation = 'james@bond.com'
jb.role = "Admin"
image = URI.parse("https://static.wikia.nocookie.net/jamesbond/images/1/11/BondConnery.jpg/revision/latest?cb=20121103192409&path-prefix=es").open
jb.avatar.attach(io: image, filename: "avatar.png" , content_type: "image/png")
jb.company = mi6
jb.save

puts "Loggable recruiter profile created"
puts "You can now login as a Recruiter with 'james@bond.com' with the password 'james@bond.com' as part of Company 'MI6'"
puts "=> Creating jobs, wait..."


seniority = ["Internship", "Junior / +3 years", "Mid-level / +5 years", "Partner / +10 years"]
employment_type = ["Part-time", "Full-time"]
location = ["London Area", "Remote"]
status = ["Closed", "Open"]
Company.all.each do |rc|
  rand(5..10).times do
    j = Job.new
    j.title = Faker::Job.title
    j.salary = rand(24000..500000).ceil(-2)
    j.employment_type = employment_type.sample
    j.location = location.sample
    j.role_description = Faker::Lorem.paragraphs(number: 1).join(' ')
    j.requirements = Faker::Lorem.paragraphs(number: 1).join(' ')
    j.benefits = Faker::Lorem.paragraphs(number: 1).join(' ')
    j.interview_process = Faker::Lorem.paragraphs(number: 1).join(' ')
    j.contact = "contact@#{rc.website}"
    j.expiry_date = Date.today + rand(12).months + rand(10).days
    j.status = status.sample
    j.searchable = true
    j.company = rc
    j.save
  end
end

puts "#{Job.count} jobs created"
puts "=> Creating candidates, wait... (This might take a while because of avatars)"

Company.all.each_with_index do |rc, i|
  repetitor = rand(2..10)
  repetitor.times do |index|
    c = Candidate.new
    image = URI.parse("https://api.lorem.space/image/face?w=256&h=256").open
    c.avatar.attach(io: image, filename: "avatar.png" , content_type: "image/png")
    c.email = Faker::Internet.free_email
    if i.even?
      c.first_name = Faker::Name.male_first_name
      c.gender = 'M'
    else
      c.first_name = Faker::Name.female_first_name
      c.gender = 'F'
    end
    c.last_name = Faker::Name.last_name
    c.phone = Faker::PhoneNumber.cell_phone_in_e164
    c.dob = Faker::Date.birthday(min_age: 18, max_age: 65)
    c.location = "London"
    c.nationality = Faker::Nation.nationality.singularize
    c.terms_of_service = true
    c.bio = Faker::Lorem.paragraphs(number: 3).join(' ')
    c.title = Faker::Job.title
    c.linkedin = 'https://www.linkedin.com/in/' + c.first_name.downcase + '-' + c.last_name.downcase
    c.availability = Faker::Date.between(from: Date.today - 10.days, to: Date.today + 30.days)
    c.password = pw = Faker::Internet.password
    c.password_confirmation = pw
    c.company = rc
    c.is_dummy = true
    c.save
    if index == repetitor - 1
      patience_message = ["Patience, my friend...", "Almost there...", "Hang on there...", "Not quite ready yet...", "Waiting is a virtue...", "Come on...", "Think I got all day?"]
      puts patience_message.sample
    end

  end
end
candidate_count = Candidate.count
puts "#{candidate_count} candidates created"
puts "=> Creating notes, wait..."

Candidate.all.sample(candidate_count/4).each do |c|
  note = Note.new
  note.candidate = c
  note.body = Faker::Lorem.paragraphs(number: 2)
  note.company = c.company
  note.recruiter = c.company.recruiters.sample
  note.save
  if note.errors.any?
    puts "#{note.errors.inspect}"
    break
  end
end

puts "#{Note.count} notes created"
puts "=> Creating JobApplications, wait..."

Candidate.all.sample(candidate_count/4).each do |c|
  ja = JobApplication.new
  ja.candidate = c
  ja.status = "Applied"
  ja.job = Job.all.sample
  ja.company = c.company
  ja.save
end

puts "#{JobApplication.count} JobApplications created"

puts "=> Creating Admins, wait..."

Admin.create(email: 'manufarez@gmail.com', password:'manufarez@gmail.com', password_confirmation: 'manufarez@gmail.com', first_name: 'Manu', last_name:'Farez')
Admin.create(email: 'gonzalo@neurotic.co', password:'gonzalo@neurotic.co', password_confirmation: 'gonzalo@neurotic.co', first_name: 'Gonzalo', last_name:'Diaz')

puts "#{Admin.count} Admins created"
puts "=> Creating Tickets"

Company.all.each do |rc|
  ticket = Ticket.new
  ticket.body = Faker::Lorem.paragraphs(number: 3)
  ticket.recruiter = rc.recruiters.sample
  ticket.company = ticket.recruiter.company
  ticket.save
  if ticket.errors.any?
    puts "#{ticket.errors.inspect}"
    break
  end
end

puts "#{Ticket.count} tickets created"
puts "Done baby! Your seeds are ready!"
