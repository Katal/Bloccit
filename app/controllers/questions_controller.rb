class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    #where does params[:id] come from?

    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(params.require(:question).permit!)
    redirect_to @question
  end

  def update
    @question = Question.find(params[:id])

    @question.update_attributes(params.require(:question).permit!)
  end
end




