class CommentsController < ApplicationController

  before_action :fetch_post, only: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment].permit(:text))
    current_user.comments << @comment
    @post.comments << @comment
    if @comment.save
      redirect_to posts_path
    else
      # flash[:error] = 'There was a problem'
      render 'new'
    end

  end # of class

  # helper
  def fetch_post
    @post = Post.find(params[:post_id])
  end

end # of class
