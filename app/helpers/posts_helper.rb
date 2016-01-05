module PostsHelper
	def user_is_authorized_for_post?(post, action)
		# authorized = false
		# case action
		# when :edit
  #       	current_user && (current_user == post.user || current_user.admin? || current_user.moderator?)
  #       	 authorized = true
        	 
  #       when :create
  #       when :delete
  #       	current_user && (current_user == post.user || current_user.admin?)
  #       	 authorized = true
        	 
  #       else 
        	
  #       end

        current_user && (current_user == post.user || current_user.admin? || current_user.moderator?)
        # authorized
   end
end
