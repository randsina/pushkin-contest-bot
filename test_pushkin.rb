require 'net/http'
require 'pry'

postData = Net::HTTP.post_form(URI.parse('http://localhost:3000/quiz'),
{"question"=>"н  еоПолпнеаеобгтецйон", "id"=>191623, "level"=>8})
