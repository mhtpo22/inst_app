require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe 'GET #index' do
     	it "assigns the requested article to @users"
    	it "renders the :index template"
    end
    
	describe 'GET #show' do
     	it "assigns the requested article to @user"
     	
    	it "renders the :show template" do
    		user = create(:user)
        	get :show, id: user
        	expect(response).to render_template :show
        end
    end
end
