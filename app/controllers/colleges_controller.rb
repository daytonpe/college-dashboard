class CollegesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_college, only: [:untier, :show, :destroy]


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

  def favorite
    current_user.colleges.push(College.find(params[:id]))
    current_user.save
    redirect_to user_colleges_path(current_user)
  end

  def add
  end

  def reset
    @colleges = current_user.colleges
    @colleges.each do |college|
      college.tier = nil
      college.save
    end
    redirect_to user_colleges_path(current_user)
  end

  def update
    @college = College.find(params[:id])
    #@college.update is actually being called in the if line
    if @college.update(college_params)
      redirect_to user_colleges_path(current_user)
    else
      flash[:alert] = "Something went wrong, try again"
      redirect_to user_colleges_path(current_user)
    end
  end

  def destroy
    @college.tier = nil
    @college.save
  	current_user.colleges.delete(@college)
    flash[:notice] = "College successfully deleted from your dashboard."
    redirect_to user_colleges_path(:current_user)
  end

  def search

    #q because that's what we called it in search.html.erb
    @colleges = College.where("name ILIKE ?", "%#{params[:q]}%")
    if @colleges
      render :search
    else
      flash[:alert] = "Sorry, your search came back empty, please try again."
      redirect_to root_path
    end


    #OLD CODE USING API
  		# create end point from search query and API url
      # q = params[:q]
      # url = "http://universities.hipolabs.com/search?name="
      # end_point = url + q
      # # make API call to end point, set result equal to response
      # response = RestClient.get(end_point)
      # # parse response.body and set result equal to data
      # data = JSON.parse(response.body)
      # @colleges = data
    

	end

  def untier
    @college.tier = nil
    @college.save
    redirect_to user_colleges_path(current_user)
  end

  def details
  # OLD CODE USING API
    #  @colleges = current_user.colleges
    # name = params[:name]
    #  url = "http://universities.hipolabs.com/search?name="
    #  end_point = url + name
    #  #since this API sucks, only going to return country
    #  response = RestClient.get(end_point)
    #  # The [0] is because it returns an array of length 1
    #  @college_info = JSON.parse(response.body)[0]
  end

  private
    def find_college
        @college = College.find(params[:id])
    end

    def college_params
    	params.require(:college).permit(:name, :web_page, :country, :tier, :address, :city, :state, :zip, :phone)
		end
end