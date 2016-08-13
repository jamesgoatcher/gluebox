require './config/boot'
require './config/environment'
require 'clockwork'

module Clockwork
	every(10.seconds, 'delete.glue') {
		@glues = Glue.where("created_at <= ?", 30.minutes.ago.utc)
		@glues.each do |glue|
			glue.destroy
		end
	}
end