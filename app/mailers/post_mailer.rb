class PostMailer < ActionMailer::Base

  default from: "noreply@instragramclone1.herokuapp.com"

  def new_post(post, user)
    @post = post # exposes @post to the view
    mail to: user.email, subject: "Thanks for your recent post '#{@post.title}'"
  end

end
