class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :fetch_post, only: [:edit, :show, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :image, :tag_names))
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    if params[:tag_id]
      # find all posts linked to the given tag
      @posts = Tag.find(params[:tag_id]).posts
    else
      @posts = Post.all
    end
  end

  def show
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params[:post].permit(:title))
    if @post.save
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to '/posts'
  end

  # helper
  def fetch_post
    @post = Post.find(params[:id])
  end

end # of class
