class CollegesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_college, only: [:show, :destroy]


   def index
  	user = current_user
    if current_user == user
      @colleges = current_user.colleges
    else
			flash[:alert] = "You do not have permission to access this page!"
      redirect_to root_path
  	end
  end

  def show
  	@college = College.find(params[:id])
  	@note = Note.new
  end

  def create
  	@colleges = College.all

    if @colleges.map(&:name).include?(college_params[:name])
      @college = College.find_by(name: college_params[:name])
      @college.users << current_user
			flash[:notice] = "#{@college.name} successfully favorited."
			redirect_to user_colleges_path(:current_user)
    else
			@college = current_user.colleges.build(college_params)
			if current_user.save
        flash[:notice] = "#{@college.name} successfully favorited."
	    	redirect_to user_colleges_path(:current_user)
			else
	    	flash[:alert] = "Unable to favorite college."
      	redirect_to user_colleges_path(:current_user)
			end
    end
  end

  def add
  end


  def destroy
  	current_user.colleges.delete(@college)
    flash[:notice] = "College successfully deleted from your dashboard."
    redirect_to user_colleges_path(:current_user)
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
  	user = current_user
  	if current_user == user
      @colleges = current_user.colleges
    else
			flash[:alert] = "You do not have permission to access this page!"
      redirect_to root_path
    end
  	name = params[:name]
    url = "http://universities.hipolabs.com/search?name="
    end_point = url + name
    #since this API sucks, only going to return country
    response = RestClient.get(end_point)
    # The [0] is because it returns an array of length 1
    @college_info = JSON.parse(response.body)[0]
  end

  private
    def find_college
        @college = College.find(params[:id])
    end

    def college_params
    	params.require(:college).permit(:name, :web_page, :country)
		end
end