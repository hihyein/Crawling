require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open("http://www.korea.ac.kr/user/restaurantMenuAllList.do?siteId=university&id=university_050402000000"))

lunch_a = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(2)//p:nth-child(4)")
puts lunch_a


day = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(2)//span.day").inner_text
puts day

date = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(2)//span.date//span")[0].inner_text + "/" +       doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(2)//span.date//span")[1].inner_text
puts date

lunch_a = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(2)//p")[1].inner_text.split("-")[1]
puts lunch_a

lunch_b = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(2)//p")[2].inner_text.split("-")[1]
puts lunch_b

dinner = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(2)//p") [3].inner_text.split("-")[1]
puts dinner






for i in (2..7)
  if i == 7
    day = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.day").inner_text
    puts day

    date = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" +         doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.date//span")[1].inner_text
    puts date

    lunch_a = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[0].inner_text.split("-")[1]
    puts lunch_a



  else
    day = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.day").inner_text
    puts day

    date = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" +         doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.date//span")[1].inner_text
    puts date

    lunch_a = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[1].inner_text.split("-")[1]
    puts lunch_a

    lunch_b = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[2].inner_text.split("-")[1]
    puts lunch_b

    dinner = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[3].inner_text.split("-")[1]
    puts dinner
  end
end
