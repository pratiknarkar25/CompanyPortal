# frozen_string_literal: true

# This controller provides comments functionality
class CommentsController < ApplicationController
  before_action :load_commentable, :set_category

  def index
    @comments = @commentable.comments.order('created_at desc')
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to [@category, @commentable]
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id,
                                    :commentable_type)
  end

  def set_category
    @category = Category.find params[:category_id]
  end

  def load_commentable
    resource, id = request.path.split('/')[3..4]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
