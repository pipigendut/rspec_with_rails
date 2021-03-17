require 'rails_helper'

RSpec.describe "Users::Sessions", type: :request do
  let(:user) { create(:user) }

  describe "POST /create" do
    context 'when login correct properly' do
      before do
        login_with_api(user)
      end
      
      it 'returns 200' do
        expect(response.status).to eq(200)
      end
    end

    context 'when login invalid' do
      before do
        post user_session_path, params: {
          email: user.email,
          password: 'random'
        }
      end
      
      it 'returns invalid password' do
        expect(json["message"]).to eq("Invalid Password or Username")
      end
    end
  end
end
