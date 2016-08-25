class ChecklistsController < ApplicationController
  def toggle
  	@checklist = Checklist.find(params[:id])
  	@checklist.c1 = !@checklist.c1

  	@checklist.save
  	redirect_to :back
  	# if @checklist.c1
   #    @checklist.count++
   #  else
   #    @checklist.count--
   #  end
  end
end
