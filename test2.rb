require 'nokogiri'
require 'open-uri'

page_uri_prefix = "https://www.koreapas.com/bbs/zboard.php?id=kfc&page="

for i in 1..1
  page = Nokogiri::HTML(open(page_uri_prefix + i.to_s))
  titles = page.css("tr.list0 span.list_title, tr.list1 span.list_title")
  puts titles
end
