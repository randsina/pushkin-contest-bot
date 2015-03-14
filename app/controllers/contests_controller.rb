class ContestsController < ApplicationController
  TOKEN = '0e0cdfcd-1bf6-490f-8107-f5a4cae91d37'
  def registration
    token = params[:token]
    question = params[:question]
    render json: {answer: 'снежные'}
  end

  def quiz
    puts params
    puts '*' * 100
    puts params[:question]
    render nothing: true
  end
end
