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
    @checklist = current_user.checklists.find_by(college_id: params[:id])
    @notes = current_user.notes.where(college_id: @college.id)
  	@note = Note.new
  end

  def favorite
    @college = College.find(params[:id])
    checklist = Checklist.create 
    checklist.user = current_user
    checklist.college = @college
    checklist.save
    current_user.colleges.push(@college)
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

	end

  def untier
    @college.tier = nil
    @college.save
    redirect_to user_colleges_path(current_user)
  end

  def details

  end

  private
    def find_college
        @college = College.find(params[:id])
    end

    def college_params
    	params.require(:college).permit(:name, :web_page, :country, :tier, :address, :city, :state, :zip, :phone)
		end
end