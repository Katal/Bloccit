class Api::V1::PostsController < Api::V1::BaseController

   before_action :authenticate_user, except: [:index, :show]
   before_action :authorize_user, except: [:index, :show]

   def index
     posts = Post.all
     render json: posts.to_json, status: 200
   end

   def show
     post = Post.find(params[:id])
     render json: {post: post, comments: post.comments}.to_json, status: 200
   end

   def update
   	post = Post.find(params[:id])
 
     if post.update_attributes(post_params)
       render json: post.to_json, status: 200
     else
       render json: {error: "Post update failed", status: 400}, status: 400
     end
   end

   def create
   end

   def destroy
   end

   private
   def post_params
     params.require(:post).permit(:title, :body)
   end

end
