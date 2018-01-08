# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable BlockLength
RSpec.describe CommentsController, type: :controller do
  describe 'POST create' do
    it 'create a new comment' do
      session[:user_id] = FactoryGirl.create(:admin_user).id
      comment_flats_for_rent = FactoryGirl.create(:comment_flats_for_rent)
      rent_post = comment_flats_for_rent.commentable

      post :create, params:
      {
        category_id: rent_post.category_id, post_id: rent_post.id,
        comment: { content: 'How much is rent' }
      }
      comment = assigns(:comment)
      expect(comment.content).to eq 'How much is rent'
      response.should redirect_to(category_post_path(rent_post.category_id,
                                                     rent_post))
    end
  end

  describe 'POST delete' do
    it 'create a new comment' do
      session[:user_id] = FactoryGirl.create(:admin_user).id
      comment_flats_for_rent = FactoryGirl.create(:comment_flats_for_rent)
      rent_post = comment_flats_for_rent.commentable

      expect do
        delete :destroy, params:
        {
          category_id: rent_post.category_id,
          post_id: rent_post.id,
          id: comment_flats_for_rent
        }
      end.to change(Comment, :count).by(-1)
      response.should redirect_to(category_post_path(rent_post.category_id,
                                                     rent_post))
    end
  end
end
