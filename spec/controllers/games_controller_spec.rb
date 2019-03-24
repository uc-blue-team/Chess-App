require 'rails_helper'

RSpec.describe GamesController, type: :controller do
	it 'returns :new view' do
		get :new
		expect(response).to render_template('new')
	end

	it 'assigns :name to kevin' do
		get :new
		expect(assigns(:name)).to eq 'kevin'
	end
end
