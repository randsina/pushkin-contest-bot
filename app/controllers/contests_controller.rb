class ContestsController < ActionController::Metal
  TOKEN = 'b7f513497ed4c72c2ff2db9ee7cb24d4'
  URI = URI("http://pushkin-contest.ror.by/quiz")

  def quiz
    result = get_result(params[:level], params[:question])
    p result

    parameters = {answer: result, token: TOKEN, task_id: params[:id]}
    Net::HTTP.post_form(URI, parameters)
  end

  private

  def get_result(level, question)
    @poems = Rails.configuration.x.poems_hash
    result = self.send("level_#{level}", question)
  end

  def level_1 question
    @poems[convert(question)][0]
  end

  def level_2 question
    question = convert(question)
    first, second = question.split('word')
    reg = Regexp.new "\\A#{first}.*#{second}\\z"
    str = @poems.keys.find { |row| row =~ reg }
    (str.split(' ') - question.split(' '))[0] if str
  end

  def level_3 question
    question.split("\n").map { |row| level_2(row) }.join(',')
  end

  def level_4 question
    question.split("\n").map { |row| level_2(row) }.join(',')
  end

  def level_5 question
    question = convert(question)
    words = question.split(' ')
    questions = words.map { |word| question.sub(word, '%WORD%') }
    index, answer = 0, ''
    questions.each_with_index do |row, i|
      if answer = level_2(row)
        index = i
        break
      end
    end
    "#{answer},#{words[index]}"
  end

  def level_6 question
    mask = get_mask(convert(question))
    @poems.find { |k, v| v[1] == mask }[0]
  end

  def level_7 question
    mask = get_mask(convert(question))
    @poems.find { |k, v| v[1] == mask }[0]
  end

  def level_8 question
    mask = get_mask(convert(question)).to_a
    answer = @poems.find do |k, v|
      hash = v[1].to_a
      (hash - mask).count <= 2 && (mask - hash).count <= 2
    end
    answer ? answer[0] : ''
  end

  def convert row
    row.mb_chars.normalize.gsub(/\p{P}/, '').downcase.squish.to_s
  end

  def get_mask(row)
    mask = Hash.new(0)
    row.gsub(/\s/, '').split('').each {|char| mask[char] += 1 }
    mask
  end
end
