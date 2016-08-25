class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  	def date_format(date) 
   		date.strftime("%m/%d/%y %I:%M %p")
		end
end
