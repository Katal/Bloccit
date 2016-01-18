class TopicsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]
  #this may be part of the tc member spec problem; added edit and update to before_action - yes
  # before_action :allowed_to_update, except: [:index, :show, :new, :create, :delete]

   def index
     @topics = Topic.all
   end

   def show
     @topic = Topic.find(params[:id])
   end

   def new
     @topic = Topic.new
   end  

   def create
     @topic = Topic.new(topic_params)
 
     if @topic.save
       redirect_to @topic, notice: "Topic was saved successfully."
     else
       flash[:error] = "Error creating topic. Please try again."
       render :new
     end
   end

   def edit
     @topic = Topic.find(params[:id])
   end

   def update
     @topic = Topic.find(params[:id])
 
     @topic.assign_attributes(topic_params)

     if @topic.save
        flash[:notice] = "Topic was updated."
       redirect_to @topic
     else
       flash[:error] = "Error saving topic. Please try again."
       render :edit
     end
   end

   def destroy
     @topic = Topic.find(params[:id])
 
     if @topic.destroy
       flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash[:error] = "There was an error deleting the topic."
       render :show
     end
   end
   
  private
 
   def topic_params
     params.require(:topic).permit(:name, :description, :public)
   end


    def authorize_user 
     unless current_user.admin? || current_user.moderator?
       flash[:alert] = "You must be a chicken to do that."
       redirect_to topics_path
     end
   end

 end


 
 #things tried but dont need
    # def authorize_user
    #  if current_user.moderator? || current_user.admin?
    #   authorize = true
    #   flash[:alert] = "Please edit below."
    # else 
    #    authorize = false
    #    flash[:alert] = "You must be an admin to do that."
    #    redirect_to topics_path
    #  end
    # end

# #trying 
#   def allowed_to_update
#   #   if ( current_user.admin? || current_user.moderator? )
#   #     flash[:alert] = "You must be an admin or moderator to do that."
#   #     redirect_to topics_path
#   end
#   end



