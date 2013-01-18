FactoryGirl.define do

	factory :user do
		sequence(:name)  { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com"}
		password "foobar"
		password_confirmation "foobar"		

		factory :admin do
			admin true
		end
	end

	factory :memory do
		date Date.today
		description "Lorem ipsum"
		location "Thessaloniki"
		mood "happy"
		occasion "wedding"
		photo "photo path"
		smells_like "teen spirit"
		sounds_like "the sea"
		title "Best Memory Ever"
		video "video path"
		user
	end
end
