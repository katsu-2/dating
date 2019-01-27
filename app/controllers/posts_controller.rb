class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]


  def index
    @posts = Post.page(params[:page]).per(6).order('created_at DESC')
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.user_id)
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    # @post = Post.new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    # @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :text, :img, :img_cache, :remove_img)
    end
end
