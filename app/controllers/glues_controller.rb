class GluesController < ApplicationController

	def index

		if current_user
			puts "======================================"
			puts "I'm logged in as #{current_user.email}"
			puts "======================================"
		else
			puts "======================================"
			puts "            I'm logged out            "
			puts "======================================"
		end

		@test  = "test test testing"
		@glues = Glue.all

	end

	def show

		@glue = Glue.find(params[:id])

	end

	def new

		@glue = Glue.new

	end

	def create

		@glue = Glue.new(glues_params)

		if @glue.save
			flash[:notice] = "Glued!"
			redirect_to '/glues'
		else
			flash[:notice] = "Invalid..."
			redirect_to 'new_glue_url'
		end

	end

	def edit
		@glue = Glue.find(params[:id])
	end

	def update
		glue = Glue.find(params[:id])
		glue.update(glues_params)

		redirect_to '/glues'
	end

	def destroy
		glue = Glue.find(params[:id])
		glue.destroy

		redirect_to '/glues'
	end

	private

		def glues_params
			params.require(:glue).permit(:title, :user, :content)
		end

end