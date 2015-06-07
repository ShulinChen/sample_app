module ApplicationHelper
	def full_title(title)
		if !title.empty?
			return title + " | sample_app"
		else 
			return "defalut title"
		end
	end
end
