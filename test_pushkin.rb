require 'net/http'
require 'pry'

postData = Net::HTTP.post_form(URI.parse('http://localhost:3000/quiz'),
  {"question"=>"Стыдливости тебя, сосед Пахом, ", "id"=>55270, "level"=>5})
