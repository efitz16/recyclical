class ElectronicsController < ApplicationController
  def index
		if params['coordinates']
			@locations = Location.joins(:material_types).where(material_types: { name: "electronics" }).near(params['coordinates'], 10)
		elsif params['zipcode']
			@locations = Location.joins(:material_types).where(material_types: { name: "electronics" }).near(params['zipcode'], 10)
		end

		if @locations[0].present?
			render '/locations/index'
		else
			render json: { message: "Resource not found" }, status: 404
		end
	end

	def create
	end
end
