class ContestsController < ApplicationController
  TOKEN = ''
  def registration
    p TOKEN = params[:token]
    p question = params[:question]
    render json: {answer: 'ruuuby'}
  end

  def quiz
    render nothing: true
  end
end
