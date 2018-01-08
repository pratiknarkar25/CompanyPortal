# frozen_string_literal: true

FactoryGirl.define do
  factory :comment do
    factory :comment_flats_for_rent do
      content 'Is rent negotiable?'
      commentable_id { FactoryGirl.create(:rent_post).try(:id) }
      commentable_type Post
      user_id { FactoryGirl.create(:normal_user).try(:id) }
    end

    factory :reply1_flats_for_rent do
      content 'Yes its negotiable upto 10k'
      commentable_id { FactoryGirl.create(:rent_post).try(:id) }
      commentable_type Post
      user_id { FactoryGirl.create(:admin_user).try(:id) }
      ancestry { FactoryGirl.create(:comment_flats_for_rent).try(:id) }
    end

    factory :comment2_flats_for_rent do
      content 'I am interested'
      commentable_id { FactoryGirl.create(:rent_post).try(:id) }
      commentable_type Post
      user_id { FactoryGirl.create(:normal_user).try(:id) }
    end
  end
end
