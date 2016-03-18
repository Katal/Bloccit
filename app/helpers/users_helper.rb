module UsersHelper

	def count_if_any(association)
		if current_user.send(association).any?
			return pluralize(current_user.send(association).count, association.to_s) 
		else
			return "{user.name} has not submitted any #{association} yet."
		end
	end
end

