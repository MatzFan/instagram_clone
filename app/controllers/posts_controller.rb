class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :fetch_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :image))
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def fetch_post
    @post = Post.find(params[:id])
  end

end # of class
