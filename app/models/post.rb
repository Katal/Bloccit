class Post < ActiveRecord::Base
	belongs_to :topic
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
	has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

	default_scope { order('rank DESC') }

	validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  after_create :send_new_post_email
  # if call back is here, where should the method be / where does it have to be?

   def up_votes
     votes.where(value: 1).count
   end
 
   def down_votes
     votes.where(value: -1).count
   end
 
   def points
     votes.sum(:value)
   end

   # Remember that votes in the above code is an implied self.votes.

   def update_rank
     age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
     new_rank = points + age_in_days
     update_attribute(:rank, new_rank)
   end


   def send_new_post_email
    #need help here and a half - how do I create a favorite?
      post = Post.last
      # post.favorite
      favorites.where(post_id: post.id).first
      # favorite_for(User).where(post.user_id = Post.last.user_id)
      FavoriteMailer.new_post(post).deliver_now
   end 
 
   

end
