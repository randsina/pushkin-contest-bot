require 'net/http'
require 'pry'

postData = Net::HTTP.post_form(URI.parse('http://localhost:3000/registration'), {
  "question" => "Отчизны внемлем призыванье",
  "token" => "dfhjasdkf9527398457sdjfhk"
  #"id"       => 6595, # TASK_ID
  #"level"    => 1,
})

binding.pry

puts postData.body
