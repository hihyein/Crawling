class AnamController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  def index
    @mon = Anamhaksick.find_by_day("월")
    @tue = Anamhaksick.find_by_day("화")
    @wed = Anamhaksick.find_by_day("수")
    @thu = Anamhaksick.find_by_day("목")
    @fri = Anamhaksick.find_by_day("금")
    @sat = Anamhaksick.find_by_day("토")
  end

  def get_anam_bob
    doc = Nokogiri::HTML(open("http://www.korea.ac.kr/user/restaurantMenuAllList.do?siteId=university&id=university_050402000000"))

    for i in [3,5,7,9,11,13]
      anam_bob = Anamhaksick.new

      day = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.day").inner_text
      anam_bob.day = day

      date = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[0].inner_text + "/" +         doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//span.date//span")[1].inner_text
      anam_bob.date = date

      if (i == 11 || i == 13)
        breakfast = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//p:nth-child(3)").inner_text.split("-")[1]
        anam_bob.breakfast = breakfast

        lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div:nth-child(4)").inner_text.split("-")[1]
        anam_bob.lunch = lunch

        dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div:nth-child(5)").inner_text.split("-")[1]
        anam_bob.dinner = dinner

      else
        breakfast_a = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//p:nth-child(3)").inner_text.split("-")[1]
        anam_bob.breakfast_a = breakfast_a

        breakfast_b = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div:nth-child(4)").inner_text.split("-")[1]
        anam_bob.breakfast_b = breakfast_b

        lunch = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div:nth-child(5)").inner_text.split("-")[1]
        anam_bob.lunch = lunch

        dinner = doc.css(".ku_restaurant//ul//li:nth-child(1)//ol:nth-child(#{i})//div:nth-child(6)").inner_text.split("-")[1]
        anam_bob.dinner = dinner
      end
      anam_bob.save
    end
    redirect_to '/anam/index'
  end

end
