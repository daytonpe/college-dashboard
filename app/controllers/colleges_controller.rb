class CollegesController < ApplicationController
	before_action :find_college, only: [:show, :destroy]

  def index
  end

  def show
  end

  def search
		# create end point from search query and API url
    q = params[:q]
    url = "http://universities.hipolabs.com/search?name="
    end_point = url + q

    # make API call to end point, set result equal to response
    response = RestClient.get(end_point)

    # parse response.body and set result equal to data
    data = JSON.parse(response.body)
    @colleges = data
    
    if @colleges
			render :search
    else
			flash[:alert] = "Sorry, your search came back empty, please try again."
			redirect_to root_path
    end
	end

  def details
  end

  private
    def find_college
        @college = College.find(params[:id])
    end

    def college_params
		end
end