require 'spec_helper'

describe LinksController, :type => :controller do



  describe "GET #new" do
    before do
      link = create(:link)
      get :new
    end

    it "add new link" do
      expect(:link).should be_a_new(Link)
    end

    it { should render_template(:partial => '_show_link') }
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new link in the database" do
        expect{
          post :create, link: attributes_for(:link)
        }.to change(Link, :count).by(1)
      end
    end
  end

  describe "GET #redirect" do
    before do
      link = crete(:link)
      get :redirect
    end

  end
end