require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new links page" do
      get :new, link: {}

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of username and password" do
        post :create, user: {username: "test_user", password: "pa"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to the link show page" do
        post :create, user: {username: "test_user", password: "password"}
        expect(response).to redirect_to(user_url(User.last))
      end
    end
  end

end
