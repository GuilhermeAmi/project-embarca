class CitiesController < ApplicationController
  def index
    @cities = City.all

    if params[:state].present?
      @cities = @cities.where(state_id: params[:state])
    end

    if params[:name].present?
      @cities = @cities.where('name ILIKE ?', "%#{params[:name]}%")
    end

    render json: @cities  
  end
end
