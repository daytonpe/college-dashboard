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

  def print_dashboard
    @colleges = current_user.colleges
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
    arr = ['c1'  ,'c2' ,'c3' ,'c4' ,'c5' ,'c6' ,'c7' ,'c8' ,'c9' ,'c10'  ,'c11'  ,'c12'  ,'c13'  ,'c14'  ,'c15'  ,'c16'  ,'c17'  ,'c18'  ,'c19'  ,'c20'  ,'c21'  ,'c22'  ,'c23'  ,'c24'  ,'c25'  ,'c26'  ,'c27'  ,'c28'  ,'c29'  ,'c30'  ,'c31'  ,'c32'  ,'c33'  ,'c34'  ,'c35'  ,'c36'  ,'c37']
    @checklist = current_user.checklists.find_by(college_id: params[:id])
    
    @checklist.c1 = false
    @checklist.c2 = false
    @checklist.c3 = false
    @checklist.c4 = false
    @checklist.c5 = false
    @checklist.c6 = false
    @checklist.c7 = false
    @checklist.c8 = false
    @checklist.c9 = false
    @checklist.c10 = false
    @checklist.c11 = false
    @checklist.c12 = false
    @checklist.c13 = false
    @checklist.c14 = false
    @checklist.c15 = false
    @checklist.c16 = false
    @checklist.c17 = false
    @checklist.c18 = false
    @checklist.c19 = false
    @checklist.c20 = false
    @checklist.c21 = false
    @checklist.c22 = false
    @checklist.c23 = false
    @checklist.c24 = false
    @checklist.c25 = false
    @checklist.c26 = false
    @checklist.c27 = false
    @checklist.c28 = false
    @checklist.c29 = false
    @checklist.c30 = false
    @checklist.c31 = false
    @checklist.c32 = false
    @checklist.c33 = false
    @checklist.c34 = false
    @checklist.c35 = false
    @checklist.c36 = false
    @checklist.c37 = false
    @checklist.count = 0
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