module TopicsHelper
   def user_is_authorized_for_topics?
       current_user && current_user.admin? 
   end

	def user_is_authorized_to_edit?
    	current_user.admin? || current_user.moderator? 
  end
    
  def user_is_authorized_to_create?
    	current_user.member? || current_user.admin? 
    	# authorized = true
    	# something is missing here, if I keep authorized = true then shows up for moderator, if I remove, doesnt show up for member. 
  end

    #is there a different logic I can use aka if user is NOT authorized to create then the button doesnt show or does it only have to be positive logic?
    #come back to this or ask Michael
end
