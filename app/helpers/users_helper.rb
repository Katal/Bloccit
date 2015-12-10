module UsersHelper

#it doesnt matter if I put this here vs in application helper, correct?
   def avatar_url(user, some_number)
     gravatar_id = Digest::MD5::hexdigest(user.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{some_number}"
   end

end
