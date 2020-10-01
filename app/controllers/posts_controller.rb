class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "ブログを作成しました！"
    else
      render :new
    end
  end

  def confirm
    @post = current_user.posts.build(post_params)
    render :new if @post.invalid?
  end

  def edit
    @post = current_user.posts.build(post_params)
  end

  def show
    @post = current_user.posts.build(post_params)
  end

  def edit
    @post = current_user.posts.build(post_params)
  end

  def update
    @post = current_user.posts.build(post_params)
    if @post.update(post_params)
      redirect_to posts_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice:"ブログを削除しました！"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image, :image_cache)
  end
end
