class FoodsController < ApplicationController
  def index
    search_term = params[:q].split.join('%20')
    api_key = '7GPfPbDIlpyJtU98WZNERF4PwxtxAShqyE8PRBd0'

    conn = Faraday.new("https://api.nal.usda.gov")

    response = conn.get("/fdc/v1/search?api_key=#{api_key}\&ingredients=#{search_term}") #generalSearchInput=#{search_term}\&
    json = JSON.parse(response.body, symbolize_names: true)
    @count = json[:totalHits]
    @foods = json[:foods]
    # require "pry"; binding.pry
  end
end
