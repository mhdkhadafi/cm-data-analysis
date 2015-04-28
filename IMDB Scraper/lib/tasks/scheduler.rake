namespace :scheduler do
	
  require './app/helpers/imdbs_helper.rb'
  
#   include 'Connection'
  
  task rating_update: :environment do
    # puts "" + "Updated time is: " + Time.now.inspect
    ImdbsHelper.set_new_ratings
  end

end
