FactoryGirl.define do
	factory :user do
		name "Michael Pap"
		email "user@example.com"
		password "mypassword"
		password_confirmation "mypassword"
	end
end