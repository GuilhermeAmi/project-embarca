require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    it 'filters cities by state' do
      state = State.create(name: 'Paraná')
      city = City.create(name: 'Curitiba', state: state)
      get :index, params: { state: state.id }
      expect(JSON.parse(response.body).map { |c| c['name'] }).to include(city.name)
    end

    it 'filters cities by name' do
      state = State.create(name: 'Paraná')
      city = City.create(name: 'Curitiba', state: state)
      get :index, params: { name: 'Curit' }
      expect(JSON.parse(response.body).map { |c| c['name'] }).to include(city.name)
    end
  end
end
