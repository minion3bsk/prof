class TopController < ApplicationController
    def index
        @question = Question.new
        @questions = current_user.group.questions
        
        @each_feeds = current_user.group.feeds.includes(:feedable).page(params[:page]).per(6)
        @feeds = @each_feeds.map(&:feedable)
    end    
end
