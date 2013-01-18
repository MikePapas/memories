class MemoriesController < ApplicationController
	before_filter :signed_in_user
	before_filter :correct_user,   only: [:edit, :update, :destroy]

	def show
		@memory = Memory.find(params[:id])
	end

	def new
		@memory = Memory.new
	end

	def create
		@memory = current_user.memories.build(params[:memory])

		if @memory.save
			flash[:success] = "Memory created"
			redirect_to user_path(current_user)		
		else
			render 'static_pages/home' 
		end
	end

	def destroy
		Memory.find(params[:id]).destroy
		flash[:success] = "Memory destroyed"
		redirect_to user_path(current_user)
	end

	def edit
	end

	def update
		if @memory.update_attributes(params[:memory])
			flash[:success] = "Memory updated"
			redirect_to @memory
		else
			render 'edit'
		end
	end

	def index
		@memories = Memory.paginate(page: params[:page])
	end

	private
	def correct_user
		@memory = current_user.memories.find_by_id(params[:id])
		redirect_to root_path if @memory.nil?
	end
end
