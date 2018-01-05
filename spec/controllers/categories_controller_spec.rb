# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable BlockLength
RSpec.describe CategoriesController, type: :controller do
  describe 'Get index' do
    it 'returns http success' do
      flats_for_rent_category = FactoryGirl.create(:flats_for_rent)
      roommate_vacancy_category = FactoryGirl.create(:roommate_vacancy)
      get 'index'
      response.should be_success
      expect(assigns(:categories)).to eq([flats_for_rent_category,
                                          roommate_vacancy_category])
    end
  end

  describe 'GET show' do
    it 'assigns the requested category as @category' do
      flats_for_rent_category = FactoryGirl.create(:flats_for_rent)
      get :show, params: { id: flats_for_rent_category }
      expect(assigns(:category)).to eq flats_for_rent_category
    end
  end

  describe 'GET new' do
    it 'calls a new category page' do
      get :new
      expect(response.status).to eq 302
    end
  end

  describe 'POST create' do
    it 'create a new category' do
      session[:user_id] = FactoryGirl.create(:admin_user).id
      post :create, params:
        {
          category:
          {
            name: 'furniture on rent',
            description: 'furniture rent will be minimal'
          }
        }
      category = assigns(:category)
      expect(category.name).to eq 'furniture on rent'
      response.should redirect_to(category_url(category))
    end

    it 'Should add name & description to create new category' do
      session[:user_id] = FactoryGirl.create(:admin_user).id
      post :create, params: { category: { name: '' } }
      category = assigns(:category)
      expect(category).to_not be_valid
      expect category.errors[:name].should include("can't be blank")
      expect category.errors[:description].should include("can't be blank")
    end
  end

  describe 'PUT update' do
    it 'update a category' do
      session[:user_id] = FactoryGirl.create(:admin_user).id
      flats_for_rent_category = FactoryGirl.create(:flats_for_rent)
      put :update, params:
      {
        id: flats_for_rent_category,
        category:
          {
            name: 'Renting for new flats',
            description: 'This is renting for new flats'
          }
      }
      category = assigns(:category)
      expect(category.name).to eq 'Renting for new flats'
      expect(category.description).to eq 'This is renting for new flats'
      response.should redirect_to(category_url(category))
    end

    it 'Should add name & description to update a category' do
      session[:user_id] = FactoryGirl.create(:admin_user).id
      flats_for_rent_category = FactoryGirl.create(:flats_for_rent)
      put :update, params: { id: flats_for_rent_category,
                             category: { name: '', description: '' } }
      category = assigns(:category)
      expect(category).to_not be_valid
      expect category.errors[:name].should include("can't be blank")
      expect category.errors[:description].should include("can't be blank")
    end
  end

  describe 'DELETE destroy' do
    it 'destroy a category' do
      session[:user_id] = FactoryGirl.create(:admin_user).id
      flats_for_rent_category = FactoryGirl.create(:flats_for_rent)
      expect do
        delete :destroy, params: { id: flats_for_rent_category.to_param }
      end.to change(Category, :count).by(-1)
      response.should redirect_to(categories_url)
    end
  end
end
