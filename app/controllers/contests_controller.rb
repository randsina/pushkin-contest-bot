class ContestsController < ApplicationController
  TOKEN = 'b7f513497ed4c72c2ff2db9ee7cb24d4'
  URI = URI("http://pushkin-contest.ror.by/quiz")

  def registration
    token = Token.new
    token.name = params[:token]
    if token.save
      question = params[:question]
      render json: {answer: 'снежные'}
    end
  end

  def quiz
    puts params[:contest]
    puts params[:question]
    puts params[:level]
    puts params[:id]

    result = self.send("level_#{params[:level]}", params[:question])

    parameters = {answer: result, token: TOKEN, task_id: params[:id]}
    Net::HTTP.post_form(URI, parameters)

    render nothing: true
  end

  def level_1 question
    "level_1 #{question}"
  end

  def level_2 question
    "level_2 #{question}"
  end

  def level_3 question
    "level_3 #{question}"
  end

  def level_4 question
    "level_4 #{question}"
  end

  def level_5 question
    "level_5 #{question}"
  end
end
