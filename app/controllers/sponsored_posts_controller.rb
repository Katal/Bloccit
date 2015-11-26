class SponsoredPostsController < ApplicationController


  def show
  	@sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    #gives you a form 
  	@sponsored_post = SponsoredPost.new
  	@topic = Topic.find(params[:topic_id])
  end

  def edit
    #presents the form you change the data to
  	@sponsored_post = SponsoredPost.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def create
    #actually does database writing
    @topic = Topic.find(params[:topic_id])
    #find brings data into ruby reference, where find is doing a look up, SP is preparing to do a save
    @sponsored_post = SponsoredPost.new(sponsored_post_params)
    #parameters come from the form
    @sponsored_post.topic = @topic

    @sponsored_post.save
    redirect_to topics_path
  end

  def update
    #makes the change in the database
     @sponsored_post = SponsoredPost.find(params[:id])
     @sponsored_post.assign_attributes(sponsored_post_params)
    
    redirect_to topics_path
  end

  def sponsored_post_params
     params.require(:sponsored_post).permit(:title, :body, :price)
  end


end

