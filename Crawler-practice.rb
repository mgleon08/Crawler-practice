require "open-uri"
require "nokogiri"

html = open("http://ezprice.com.tw/").read

doc = Nokogiri::HTML(html)

ans = []
doc.search('img').each do |i|
  ans << i.attr('src')
end

temp_ans = ans.map{|url| url.match(/^http/) ? url : "http://ezprice.com.tw/#{url}"}

puts temp_ans

temp_ans.each do |full_url|
  `wget #{full_url}`
end