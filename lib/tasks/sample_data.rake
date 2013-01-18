namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "AdminUser",
			email: "admin@admin.com",
			password: "adminadmin",
			password_confirmation: "adminadmin")
		admin.toggle!(:admin)

		99.times do |n|
			name= Faker::Name.name
			email = "example-#{n+1}@example.org"
			password= "password"
			User.create!(name: name,
				email: email,
				password: password,
				password_confirmation: password)
		end

		users = User.all(limit: 6)
		15.times do |n|
			title = "Sample title #{n+1}"
			photo = "Photo will be here"
			users.each{ |user| user.memories.create!(title: title, photo: photo)}
		end
	end
end