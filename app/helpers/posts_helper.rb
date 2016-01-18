module PostsHelper
	def user_is_authorized_for_post?(post)
    current_user && ( current_user == post.user || current_user.admin? || current_user.moderator? )
       # authorized = true
       # edit button now works with authorized removed
       # SIMPLIFED BOOLEAN WORKS BEST, BUT I THINK THIS HAS TO STAY AS IS
  end

  def user_is_authorized_delete_post?(post)
    current_user && (current_user == post.user || current_user.admin?)
  end

end



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
        	
  #       en
  
   #      current_user && (current_user == post.user || current_user.admin? || current_user.moderator?)
   #      # authorized

   #      #there has to be a way for this to simplify, with just user / post info and without actions and just use different methods in the views depending on who need to authorize for?
#    en
# en
