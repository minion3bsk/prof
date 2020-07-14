class QuestionsController < ApplicationController
  def create
    Question.create(question_params)
    redirect_to root_path and return
  end
  
  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end
  
  private
  def question_params
    params.require(:question).permit(:text).merge(group_id: current_user.group.id, user_id: current_user.id)
  end  
end
