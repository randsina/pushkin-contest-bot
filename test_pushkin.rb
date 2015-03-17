require 'net/http'
require 'pry'

postData = Net::HTTP.post_form(URI.parse('http://localhost:3000/quiz'),
  {"question"=>"Сребрит мороз %WORD% поле,\nПроглянет день %WORD% будто поневоле\nИ скроется за край %WORD% гор.", "id"=>55270, "level"=>4})
