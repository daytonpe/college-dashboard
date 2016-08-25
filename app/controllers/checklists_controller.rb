class ChecklistsController < ApplicationController
  def toggle
  	@checklist = Checklist.find(params[:id])
  	@checklist.download_application = !@checklist.download_application

  	@checklist.save

  	if @checklist.download_application
          @checklist.count++
       else
          @checklist.count--
       end
  end
end
