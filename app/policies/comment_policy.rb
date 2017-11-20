# frozen_string_literal: true

# This class adds authorization for comments
class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def edit?
    @user&.id == @comment.user_id || @user&.role == 'admin'
  end

  def update?
    edit?
  end

  def show?
    true
  end

  def destroy?
    edit?
  end
end
