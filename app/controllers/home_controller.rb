class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89129&distance=0&API_KEY=CB733BFA-EE0D-4E77-BDFB-721C683A708A'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
   
   #check for emptyreturn resu 
    if @output.empty?
      @final_output = "Error"
    else
      @final_output = @output[0]['AQI']
    end
    
    
  end
end
