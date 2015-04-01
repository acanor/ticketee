class CommentsController < ApplicationController
	before_filter :require_signin!
	before_action :set_ticket

	def create
		#@comment = @ticket.comments.build(params[:comment])
		@comment = @ticket.comments.build(comment_params)
		@comment.user = current_user

		if @comment.save
			flash[:notice] = "Comment has been created."
			redirect_to [@ticket.project, @ticket]
		else
			flash[:alert] = "Comment has not been created."
			render template:  "tickets/show"
		end
	end

	private

		def set_ticket
			@ticket = Ticket.find(params[:ticket_id])
		end
	
		def comment_params
			params.require(:comment).permit(:text)
		end
end
