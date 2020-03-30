class FoodsController < ApplicationController
  def index
    search_term = params[:q]
    search = {"generalSearchInput" : params[:q]}

    conn = Faraday.new("https://api.nal.usda.gov") do |faraday|
      faraday.headers["API-KEY"] = '7GPfPbDIlpyJtU98WZNERF4PwxtxAShqyE8PRBd0' #ENV['FOOD_API_KEY']
    end

    response = conn.get("/fdc/v1/search?api_key=#{conn.headers["API_KEY"]}\&generalSearchInput=#{search_term}")
    json = JSON.parse(response.body, symbolize_names: true)
    @foods = json[:foods]
  end

  def create
    require "pry"; binding.pry
  end
end
