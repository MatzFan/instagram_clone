class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :fetch_post, only: [:edit, :show, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :price, :image, :tag_names))
    current_user.posts << @post
    # adds this post to the current user's list of posts
    # current_user.posts << @post
    if @post.save
      redirect_to posts_path
    else
      # flash[:error] = 'There was a problem'
      render 'new'
    end
  end

  def index
    # display all or just those tagged, if tag provided
    @posts = Post.for_tag_or_all params[:tag_id]
  end

  def show
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params[:post].permit(:title, :price))
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
