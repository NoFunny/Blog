require 'rails_helper'

RSpec.describe 'sessions/new.html.erb', type: :view do
  describe "GET #new" do
    it "render customer partial" do
      get :signup
      expect(response).to render_template new_user_path
    end
  end
end
