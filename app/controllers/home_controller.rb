class HomeController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  def index
    @mon = Haksick.find_by_day("월")
    @tue = Haksick.find_by_day("화")
    @wed = Haksick.find_by_day("수")
    @thu = Haksick.find_by_day("목")
    @fri = Haksick.find_by_day("금")
    @sat = Haksick.find_by_day("토")
  end

  def get_bob
    doc = Nokogiri::HTML(open("http://www.korea.ac.kr/user/restaurantMenuAllList.do?siteId=university&id=university_050402000000"))
    for i in (2..7)
      bob = Haksick.new
      if i == 7
        day = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.day").inner_text
        bob.day = day

        date = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" + doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.date//span")[1].inner_text
        bob.date = date

        lunch_a = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[0].inner_text.split("-")[1]
        bob.lunch_a = lunch_a

      else
        day = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.day").inner_text
        bob.day = day

        date = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" + doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//span.date//span")[1].inner_text
        bob.date = date

        lunch_a = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[1].inner_text.split("-")[1]
        bob.lunch_a = lunch_a

        lunch_b = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[2].inner_text.split("-")[1]
        bob.lunch_b = lunch_b

        dinner = doc.css(".ku_restaurant//ul//li:nth-child(2)//ol:nth-child(#{i})//p")[3].inner_text.split("-")[1]
        bob.dinner = dinner
      end
      bob.save
    end
    redirect_to '/'
  end
end
