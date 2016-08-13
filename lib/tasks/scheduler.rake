desc "Removes post that are 5 minutes old and older"
task :delete_glue => :environment do
	Glue.where("created_at <= ?", 5.minutes.ago.utc).each do |glue|
		glue.destroy
	end
end