class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    # @comments = @post.comments
    # @user = User.find_by(id: @post.userid)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :text, :img, :img_cache, :remove_img)
    end
end
