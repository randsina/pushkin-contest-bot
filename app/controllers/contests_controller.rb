class ContestsController < ApplicationController
  TOKEN = ''
  def registration
    render json: { answer: 'ruuuuby' }
  end

  def quiz
    render nothing: true
  end
end
