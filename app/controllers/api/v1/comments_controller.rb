class Api::V1::CommentsController < Api::V1::BaseController

   before_action :authenticate_user, except: [:index, :show]
   before_action :authorize_user, except: [:index, :show]

   def index
     comments = Comment.all
     render json: comments.to_json, status: 200
   end

   def show
     comment = Comment.find(params[:id])
     render json: {comment: comment}.to_json, status: 200
   end

   # def update
   # 	post = Post.find(params[:id])
 
   #   if post.update_attributes(post_params)
   #     render json: post.to_json, status: 200
   #   else
   #     render json: {error: "Post update failed", status: 400}, status: 400
   #   end
   # end

   # def create
   # end

   # def destroy
   # end

   private
   def comment_params
     params.require(:comment).permit(:body)
   end

end