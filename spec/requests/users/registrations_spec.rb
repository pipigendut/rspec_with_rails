require 'rails_helper'

RSpec.describe "Users::Registrations", type: :request do
  describe 'POST /create' do
    context 'When creating a new user' do
      let(:user) { build(:user) }

      before do
        post user_registration_path, params: user.as_json.merge(
          password: 'password',
          password_confirmation: 'password'
        )
      end
  
      it 'returns 200' do
        expect(response.status).to eq(200)
      end
    end
  
    context 'When an email already exists' do
      let(:user) { User.last }

      before do
        post user_registration_path, params: user.as_json.merge(
          password: 'password',
          password_confirmation: 'password'
        )
      end
  
      it 'returns 500' do
        expect(response.status).to eq(500)
      end
    end
  end
end
