require 'net/http'
require 'pry'

postData = Net::HTTP.post_form(URI.parse('http://localhost:3000/quiz'),
{"question"=>"sMai orpu uen âgcer  oh mon eDui nno", "id"=>188862, "level"=>6})
