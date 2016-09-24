class FoodScrapsController < ApplicationController
	def new

	end

	def create
		client = SODA::Client.new({:domain => "data.cityofnewyork.us", :app_token => ENV['DISPOSAL_NETWORKS']})

		results = client.get("9m2c-n6wx", :$limit => 5000)

		params['zip']
	end
end
