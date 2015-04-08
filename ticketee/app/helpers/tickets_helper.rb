module TicketsHelper
	def state_for(comment)
		content_tag(:div, class: "states") do
			if comment.state
				previus_state = comment.previus_state
				if previus_state && comment_state != previus_state
					"#{render previus_state} &rarr; #{render comment.state}"
				else
					render(comment.state)
				end
			end
		end
	end
end
