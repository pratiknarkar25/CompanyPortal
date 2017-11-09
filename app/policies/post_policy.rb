# frozen_string_literal: true

# This class adds authorization for posts
class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def edit?
    current_user.id == @post.user_id || current_user.role == 'admin'
  end

  def update?
    edit?
  end
end
