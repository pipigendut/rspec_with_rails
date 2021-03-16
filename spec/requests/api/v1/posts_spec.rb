require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do
  let(:user) { create(:user) }

  describe "GET /index" do
    context 'When get posts show correct properly' do
      before do
        login_with_api(user)
        get api_v1_posts_path, headers: {
          'Authorization': "Bearer #{JSON.parse(response.body)["result"]["token"]}"
        }
        
      end
  
      it 'returns 200' do
        expect(response.status).to eq(200)
      end
    end
  end
end
