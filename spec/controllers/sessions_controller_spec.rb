# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST create' do
    it 'create a new session' do
      user = FactoryGirl.create(:normal_user)
      User.stub(:from_omniauth).and_return(user)
      post :create, params: {}
      expect(flash[:error]).to eq nil
      expect(session[:user_id]).to eq user.id
      response.should redirect_to(root_path)
    end
  end

  describe 'DELETE destroy' do
    it 'destroy a session' do
      session[:user_id] = FactoryGirl.create(:admin_user).id
      delete :destroy, params: { id: session[:user_id] }
      expect(session[:user_id]).to eq nil
      response.should redirect_to(root_path)
    end
  end
end
