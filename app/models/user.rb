class User < ActiveRecord::Base
  has_many :posts
	before_save { self.email = email.downcase }
  #split first last name
  #loop over each, uppercase first letter of each name
  #recombine with space in between, save to name attribute
  # how am I supposed to validate / test w TDD and where?
  # http://stackoverflow.com/questions/10210493/rails-ensure-capitalization-in-model
  before_save { 

    array = name.split

    array.each do |n|
      n.capitalize!
    end



    self.name = array.join(" ")

  }

   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

   validates :name, length: { minimum: 1, maximum: 100 }, presence: true
   
   validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
   validates :password, length: { minimum: 6 }, allow_blank: true

   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 100 },
             format: { with: EMAIL_REGEX }

   has_secure_password
end
