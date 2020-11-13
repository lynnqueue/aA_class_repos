require 'rails_helper'

RSpec.describe DropsController, type: :controller do

  describe "get#index" do

    it "should render the drops index" do

      get :index 
      # HTTP verb is our method, action as a symbol is the argument

      expect(response).to render_template(:index)
    end 

  end
  
  describe "get#new" do
    it "should render the new drop form" do
      create :user
      allow(subject).to receive(:current_user).and_return(User.last)
      
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "get#show" do
    it "should render the drop show page" do
      drop = create :drop
      get :show, params: { id: drop.id }

      puts drop.body
      expect(response).to render_template(:show)
    end
  end

  describe "post#create" do
    before :each do
      create :user
      allow(subject).to receive(:current_user).and_return(User.last)
    end

    let(:valid_params) { { drop: { body: "I wish I was a Chuck Norris fact" } } }
    let(:invalid_params) { { drop: { text: Faker::ChuckNorris.fact } } }

    context "with valid params" do
      it "creates the drop" do
        post :create, params: valid_params

        expect(Drop.last.body).to eq("I wish I was a Chuck Norris fact")
      end

      it "redirects to drops show page" do 
        post :create, params: valid_params

        expect(response).to redirect_to(drop_url(Drop.last))
      end
    end

    context "with invalid params" do
      it "renders the new template" do
        post :create, params: invalid_params

        expect(response).to render_template(:new)
        expect(response).to have_http_status(422)
      end
    end

  end

  describe "delete#destroy" do
    let(:test_drop) { create(:drop) }

    before :each do
      allow(subject).to receive(:current_user).and_return(test_drop.author)
      delete :destroy, params: { id: test_drop.id }
    end

    it "destroys the drop" do
      expect(Drop.exists?(test_drop.id)).to be false
    end

    it "redirects to drops_url" do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(drops_url)
    end
  end
end