class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  after_save :update_post
  

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }, presence: true

  private
 
   def update_post
     post.update_rank
   end
 

   #user creates 1 vote for post they just created
   # user.votes.create vs post.votes.create - what's the difference
   
end
