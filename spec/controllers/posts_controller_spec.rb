# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable BlockLength
RSpec.describe PostsController, type: :controller do
  describe 'Get index' do
    it 'returns http success' do
      rent_post = FactoryGirl.create(:rent_post)
      get 'index', params: { category_id: rent_post.category_id }
      response.should be_success
      expect(assigns(:posts)).to eq([rent_post])
    end
  end

  describe 'GET show' do
    it 'assigns the requested post as @post' do
      rent_post = FactoryGirl.create(:rent_post)
      get :show, params: { id: rent_post, category_id: rent_post.category_id }
      expect(assigns(:post)).to eq rent_post
    end
  end

  describe 'GET new' do
    it 'calls a new post page' do
      rent_post = FactoryGirl.create(:rent_post)
      get :new, params: { category_id: rent_post.category_id }
      expect(response.status).to eq 302
    end
  end

  describe 'POST create' do
    it 'create a new post' do
      session[:user_id] = FactoryGirl.create(:admin_user).id
      vacancy_post = FactoryGirl.build(:vacancy_post)
      post :create, params:
      {
        category_id: vacancy_post.category_id,
        post:
        {
          title: 'Need Male Roommate in Magarpatta, Pune',
          description: 'my test post',
          address: 'test address',
          price: 1000,
          contact_number: '9899999999'
        }
      }
      post = assigns(:post)
      expect(post.title).to eq 'Need Male Roommate in Magarpatta, Pune'
      response.should redirect_to(category_post_path(vacancy_post.category_id,
                                                     post))
    end

    it 'Should add title & description to create new category' do
      session[:user_id] = FactoryGirl.create(:admin_user).id
      vacancy_post = FactoryGirl.build(:vacancy_post)
      post :create, params: {
        category_id: vacancy_post.category_id,
        post: {
          title: '',
          description: '',
          address: 'test address',
          price: 1000,
          contact_number: '9899999999'
        }
      }
      post = assigns(:post)
      expect(post).to_not be_valid
      expect post.errors[:title].should include("can't be blank")
      expect post.errors[:description].should include("can't be blank")
    end
  end
end
