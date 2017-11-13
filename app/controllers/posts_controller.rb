# frozen_string_literal: true

# This class provides the CRUD for posts
class PostsController < ApplicationController
  before_action :require_authentication
  before_action :set_category, except: :my_posts
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = @category.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @commentable = @post
    @comments = @commentable.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    authorize @post, :edit?
  end

  # POST /posts
  # POST /posts.json
  # rubocop:disable MethodLength
  def create
    @post = build_post
    respond_to do |format|
      if @post.save
        format.html do
          redirect_to category_post_path(@category, @post),
                      notice: 'Post was successfully created.'
        end
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize @post, :update?
    respond_to do |format|
      if @post.update(post_params)
        format.html do
          redirect_to category_post_path(@category, @post),
                      notice: 'Post was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize @post, :destroy?
    @post.destroy
    respond_to do |format|
      format.html do
        redirect_to category_posts_path(@category),
                    notice: 'Post was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  def my_posts
    @posts = current_user.posts
    render :index
  end

  private

  def build_post
    post = Post.new(post_params)
    post.user = current_user
    post.category = @category
    post
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def set_category
    @category = Category.find params[:category_id]
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :description, :address, :price,
                                 :price, :contact_number, :published,
                                 :published_date)
  end
end
