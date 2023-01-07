require 'rails_helper'

RSpec.describe StoresController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/stores').to route_to('stores#index')
    end

    it 'routes to #new' do
      expect(get: '/stores/new').to route_to('stores#new')
    end
  end
end