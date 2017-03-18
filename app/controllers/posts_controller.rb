class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(updated_at: :desc).page(params[:page])
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
      if @post.update(post_params)
         redirect_to @post, notice: 'Post was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    if @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
    end
  end

  private
  
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.fetch(:post, {}).permit(:title, :body)
    end
end
