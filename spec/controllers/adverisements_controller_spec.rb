require 'rails_helper'
include RandomData
RSpec.describe AdverisementsController, type: :controller do

let(:my_ad) do
  Adverisement.create(
    id: 1,
    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph,
    price: 99
    )
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_ad] to @adverisements" do
      get :index
      expect(assigns(adverisements)).to eq([my_ad])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_ad.id}
      expect(response).to render_template :show
    end

    it "assigns my_ad to @adverisements" do
      get :show, {id: my_ad.id}
      expect(assigns(:advertisement)).to eq(my_ad)
    end
  end

  describe "POST create" do
    it "increases the number of adverisements by 1" do
      expect{post :create, advertisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}}.to
      change(Adverisement,:count).by(1)
    end

    it "assigns the new adverisment to @adverisement" do
      post :create, adverisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}
      expect(assigns(:adverisement)).to eq Adverisement.last
    end

    it "redirects to the new adverisement" do
      post :create, adverisement: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}
      expect(response).to redirect_to Adverisement.last
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @adverisement" do
      get :new
      expect(assigns(:adverisement)).not_to be_nil
    end
  end
end
