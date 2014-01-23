class PostMailer < ActionMailer::Base

  default from: "noreply@instragramclone1.herokuapp.com"

  def new_post
    mail to: "bruce.steedman@gmail.com", subject: "test"
  end

end
