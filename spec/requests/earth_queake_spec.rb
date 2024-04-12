require 'rails_helper'
require 'debug'

RSpec.describe "EarthQueakes", type: :request do
  describe "GET /features" do
    it "should return OK and empty data" do
      get '/features'
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to  have_http_status(:ok)
    end
  end

  describe "with data in the db" do
    let!(:event) {create_list(:eventearthquake, 10)}
 
    it "return all eventsearthquake" do
      get '/features'
      payload = JSON.parse(response.body)
      #binding.break   

      expect(payload.size).to eq(event.size)
      expect(response).to have_http_status(200)
    end
  end
end
