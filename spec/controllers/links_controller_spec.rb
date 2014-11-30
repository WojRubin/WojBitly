require 'spec_helper'

describe LinksController, :type => :controller do

  describe "GET #new" do
    before do
      get :new
    end

    it "add new link" do
      assigns(:link).should be_a_new(Link)
    end

     it "renders the :new template" do
      expect(subject).to render_template(:new)
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new link in the database" do
        expect{
          post :create, format: :js,link: attributes_for(:link)
        }.to change(Link, :count).by(1)
      end
    end

    context "with invalid attributes" do
      before do
        get :new, format: :js, link:{real_link: "onet.pl"}
      end

      it "not saves the new link in the database" do
        expect { response }.to_not change(Link,:count)
      end
    end
  end

  describe "GET #redirect" do
    before do
      @link = create(:link)
      get :redirect, :bitly_link => Converter.new.to_bitly_link(@link.id)
    end

    it "redirect ro real link" do
      expect(response).to redirect_to(@link.real_link)
    end
  end
end