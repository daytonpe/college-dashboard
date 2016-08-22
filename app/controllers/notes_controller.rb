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
  	if @note.user != current_user
  		sign_out current_user
  		redirect_to root_path
  	end
  end

  def update
  	if @note.user == current_user
  		if @note.update(note_params)
  			flash[:notice] = "Review updated successfully."
  		else
  			flash[:alert] = "Unable to update note."
  			render :edit
  		end
  	else
  		sign_out current_user
  		redirect_to root_path
  	end
  end

  def destroy
  	@college = @note.college
		if @note.user == current_user
			@review.destroy
			flash[:alert] = "Note deleted successfully"
			redirect_to redirect_to user_colleges_path(:current_user)

		else
			sign_out current_user
			redirect_to root_path
		end

  end

  private
  def find_review
  	@note = Note.find(params[:id])
  end

  def note_params
  	params.require(:note).permit(:body)
  end
end
