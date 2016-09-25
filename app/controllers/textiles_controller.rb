class TextilesController < ApplicationController
  def index
		if params['coordinates']
			@locations = Location.joins(:material_types).where(material_types: { name: "textiles" }).near(params['coordinates'], 5)
		elsif params['zipcode']
			@locations = Location.joins(:material_types).where(material_types: { name: "textiles" }).near(params['zipcode'], 5)
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
