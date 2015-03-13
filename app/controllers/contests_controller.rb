class ContestsController < ApplicationController
  TOKEN = ''
  def registration
    token = params[:token]
    question = params[:question]
    render json: {answer: 'ruuuby'}
  end

  def quiz
    render nothing: true
  end
end
