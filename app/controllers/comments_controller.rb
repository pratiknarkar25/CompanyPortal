# frozen_string_literal: true

# This controller provides comments functionality
class CommentsController < ApplicationController
  before_action :load_commentable, :set_category

  def index
    @comments = @commentable.comments.order('created_at desc')
  end

  def new
    @comment = @commentable.comments.new(parent_id: params[:parent_id])
    render partial: 'form'
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to [@category, @commentable]
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment, :destroy?
    @comment.destroy
    respond_to do |format|
      format.html do
        redirect_to category_post_path(@category, @commentable),
                    notice: 'Comment deleted successfully'
      end
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id,
                                    :commentable_type, :parent_id)
  end

  def set_category
    @category = Category.find params[:category_id]
  end

  def load_commentable
    resource, id = request.path.split('/')[3..4]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
