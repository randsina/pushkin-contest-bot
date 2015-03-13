require 'net/http'
require 'pry'

postData = Net::HTTP.post_form(URI.parse('http://pushkin-bot.herokuapp.com/registration'), {'postKey'=>'postValue'})

binding.pry

puts postData.body
