# frozen_string_literal: true

# This class adds authorization for posts
class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def edit?
    !@post.deactivated && (@user&.id == @post.user_id ||
                           @user&.role == 'admin')
  end

  def update?
    edit?
  end

  def new?
    @user
  end

  def show?
    true
  end

  def destroy?
    edit?
  end

  def delete_photo?
    edit?
  end

  def deactivate?
    edit?
  end
end
