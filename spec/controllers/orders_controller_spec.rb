require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe "GET #new" do
    let(:movie) { movies(:interstellar) }

    it "returns http success" do
      get :new, movie_id: movie.id
      expect(response).to have_http_status(:success)
    end
  end

end
