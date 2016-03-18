class Topic < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :labelings, as: :labelable
    has_many :labels, through: :labelings

  
    scope :publicly_viewable, -> { where(public: true) }
    scope :privately_viewable, -> { where(public: false) }
    #need to call and test scopes in console

    scope :visible_to, -> (user) { user ? all : publicly_viewable }
    #need to put publicly_viewable in visible_to syntax
end
