class ChargesController < ApplicationController

  before_action :get_related_post, only: [:create, :new]

  def new
  end

  def create
    @amount = (@post.price * 100).to_i # Stripe needs pounds converted to pence
    customer = Stripe::Customer.create(
      email: current_user.email, # assumes purchases from authenticated user
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Purchase of #{@post.title}",
      currency: 'GBP'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  #helper
  def get_related_post
    @post = Post.find(params[:post_id])
  end

end # of class
