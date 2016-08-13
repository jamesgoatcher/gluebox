class UsersController < ApplicationController

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

	end

	def show

	end

	def secure

		id   = current_user.id
		user = User.find(id)

		puts "======"
		p user
		puts "======"

	end

end