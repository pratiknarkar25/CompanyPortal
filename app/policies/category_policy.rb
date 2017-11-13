# frozen_string_literal: true

# This class adds authorization for categories
class CategoryPolicy < ApplicationPolicy
  attr_reader :user, :category

  def initialize(user, category)
    @user = user
    @category = category
  end

  def new?
    @user.role == 'admin'
  end

  def show?
    true
  end

  def index?
    true
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new?
  end

  def destroy?
    new?
  end
end
