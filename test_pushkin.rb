require 'net/http'
require 'pry'

postData = Net::HTTP.post_form(URI.parse('http://localhost:3000/registration'),
  {"question"=>"К Стамбулу грозно притекли", "id"=>55270, "level"=>1})

binding.pry

puts postData.body
