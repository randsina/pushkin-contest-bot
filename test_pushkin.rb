require 'net/http'
require 'pry'

postData = Net::HTTP.post_form(URI.parse('http://chappie.herokuapp.com/quiz'),
  {"question"=>"Стыдливости тебя, сосед Пахом, ", "id"=>55270, "level"=>6})
