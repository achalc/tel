namespace :db do

	desc "erase existing db and fill"
	task :populate => :environment do
		require 'populator'
		require 'faker'

		[Category, Friend, Notification, Photo, Suggestion, User].each(&:delete_all)
		
		100.times do
			user = User.new
			user.first_name = Faker::Name.first_name
			user.last_name = Faker::Name.last_name
			user.email = Faker::Internet.email
			user.password_digest = Faker::Internet.password(10)
			user.save!
		end

		10.times do
			category = Category.new
			category.name = Faker::Commerce.department
			category.save!
		end

		1000.times do
			suggestion = Suggestion.new
			suggestion.user_id = User.offset(rand(User.count)).first.id
			suggestion.category_id = Category.offset(rand(Category.count)).first.id
			suggestion.name = Faker::Lorem.sentence(3)
			suggestion.description = Faker::Lorem.paragraph
			suggestion.liked = true
			suggestion.location = Faker::Company.name
			suggestion.save!
		end 	
	end
end