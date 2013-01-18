require 'spec_helper'

describe "MemoryPages" do
	subject { page }

	describe "new memory page" do
		before { visit new_memory_path }

		it { should have_selector('h1', text: 'Create memory') }
		it { should have_selector('title', text: 'Create memory') }
	end
end
