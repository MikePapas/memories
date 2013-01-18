require 'spec_helper'

describe Memory do
	let(:user) { FactoryGirl.create(:user) }

	before { @memory = user.memories.build(date: Date.today, description: "Lorem ipsum", 
		location: "Thessaloniki", mood: "happy", occasion: "wedding", photo: "photo path",
		smells_like: "teen spirit", sounds_like: "the sea",	title: "Best Memory Ever", 
		video: "video path") }	

	subject { @memory }	

	it { should respond_to(:user_id) }
	it { should respond_to(:date) }
	it { should respond_to(:description) }
	it { should respond_to(:location) }
	it { should respond_to(:mood) }
	it { should respond_to(:occasion) }
	it { should respond_to(:photo) }
	it { should respond_to(:smells_like) }
	it { should respond_to(:sounds_like) }
	it { should respond_to(:title) }
	it { should respond_to(:video) }

	it { should respond_to(:user) }
	its(:user) { should == user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @memory.user_id = nil }
		it { should_not be_valid }
	end

	describe "accessible attributes" do
		it "should not allow access to user_id" do
			expect do
				Memory.new(user_id: user.id)
			end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end
end