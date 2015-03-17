require 'net/http'
require 'pry'

postData = Net::HTTP.post_form(URI.parse('http://localhost:3000/quiz'),
  {"question"=>"О ты, певцу дубрав %WORD% знакомый гений", "id"=>55270, "level"=>2})
