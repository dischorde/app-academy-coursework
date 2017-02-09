require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  describe "GET #new" do
    it "renders the new goal page" do
      get :new, link: {}

      expect(response).to render_template("new")
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of status, title, and privacy " do
        post :create
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "validates privacy" do
        post :create, goal: {title: "Finish Project", status: "Complete", privacy: "hidden"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "validates status" do
        post :create, goal: {title: "Finish Project", status: "not happy", privacy: "public"}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to the goal show page" do
        post :create, user: {title: "Finish Project", status: "Ongoing", privacy: "public"}
        expect(response).to redirect_to(goal_url(Goal.last))
      end
    end
  end


  
end
