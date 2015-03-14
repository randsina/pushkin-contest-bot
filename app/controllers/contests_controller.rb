class ContestsController < ApplicationController
  TOKEN = '0e0cdfcd1bf6490f8107f5a4cae91d37'
  def registration
    token = params[:token]
    puts token
    question = params[:question]
    render json: {answer: 'снежные'}
  end

  def quiz
    puts params[:contest]
    answer = self.send("level_#{params[:level]}", params[:question])
    send_answer(answer, params[:task_id])
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

  def send_answer(answer, task_id)
    uri = URI("http://pushkin-contest.ror.by/quiz")
    parameters = {
      answer: answer,
      token: TOKEN,
      task_id: task_id
    }
    Net::HTTP.post_form(uri, parameters)
  end
end
