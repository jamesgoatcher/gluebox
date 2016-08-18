desc "Removes post that are 9 minutes old and older"
task :delete_glue => :environment do
	Glue.where("updated_at <= ?", 9.minutes.ago.utc).each do |glue|
		glue.destroy
	end
end