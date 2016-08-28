class ChecklistsController < ApplicationController
  def toggle
    @checklist = Checklist.find(params[:id])
    @checklist[params[:attr]] = !@checklist[params[:attr]]

    # Adjust the counter
    if @checklist[params[:attr]]
      @checklist.count+=1
    else
      @checklist.count-=1
    end

  	@checklist.save
  	redirect_to :back

  end
end
