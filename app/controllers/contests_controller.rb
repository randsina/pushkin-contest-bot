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
    result = self.send("level_#{params[:level]}", convert(params[:question]))

    puts result
    parameters = {answer: result, token: TOKEN, task_id: params[:id]}
    Net::HTTP.post_form(URI, parameters)

    render nothing: true
  end

  private

  def level_1 question
    Poem.find_by(row: question).title
  end

  def level_2 question
    first, second = question.split(' word ')
    poem = Poem.find_by("row LIKE ? AND row LIKE ?","%#{first}%", "%#{second}%")
    (poem.row.split(' ') - question.split(' '))[0]
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

  def convert row
    row.mb_chars.gsub(/\p{P}/, '').gsub(/\s/, ' ').downcase.strip.to_s
  end
end
