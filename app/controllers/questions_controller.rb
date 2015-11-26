class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    #where does params[:id] come from?

    @question = Question.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
    @question = Question.find(params[:id])

    @question.update_attributes(params.require(:question).permit!)
  end
end




