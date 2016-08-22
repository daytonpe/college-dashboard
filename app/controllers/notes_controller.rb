class NotesController < ApplicationController
  
  def index
  	user = current_user
    if current_user == user
      @colleges = current_user.colleges
      @college = College.find_by(name: college_params[:name])
      @notes = @college.notes
    else
			flash[:alert] = "You do not have permission to access this page!"
      redirect_to root_path
    end
  end


  def create
  	@college = College.find(params[:college_id])
  	@note = @college.notes.build(note_params)
  	@note.user = current_user
  	if @college.save
  		flash[:notice] = "Note added successfully."
  		redirect_to @college
  	else
  		flash[:alert] = "Note could not be added, please try again."
  		redirect_to user_colleges_path(:current_user)
  	end
  end

  def edit
  	# @college = College.find(params[:id])
  	@note = Note.find(params[:id])
  end

  def update
  	@note = Note.find(params[:id])
  	@college = @note.college
		if @note.update(note_params)
			flash[:notice] = "Review updated successfully."
			redirect_to @college
		end
  end

  def destroy
		@note = Note.find(params[:id])
  	@college = @note.college
			@note.destroy
			flash[:alert] = "Note deleted successfully"
			redirect_to @college


  end

  private
  def find_review
  	@note = Note.find(params[:id])
  end

  def note_params
  	params.require(:note).permit(:body)
  end
end
