FactoryGirl.define do
	factory :user do
		name "Michael Pap"
		email "michael@example.com"
		password "mypassword"
		password_confirmation "mypassword"
	end
end