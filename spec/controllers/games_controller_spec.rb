require 'rails_helper'

RSpec.describe GamesController, type: :controller do
	it 'returns :new view' do
		get :new
		expect(response).to render_template('new')
	end

	it 'returns :show view' do
		get :show
		expect(response).to render_template('show')
	end

	it 'returns :create view' do
		get :create
		expect(response).to render_template('create')
	end
end
