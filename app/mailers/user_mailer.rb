class UserMailer < ActionMailer::Base
  
  def feedback(message)
    @message = message
    mail(:to => "ravi.kukreja@gmail.com", :from => 'ravi.kukreja@gmail.com', :subject => "Bookshelf Feedback from #{@message.name}")
  end

  def comment_response(comment, user)
    @comment = comment
    @user = user
    mail :to => @user.email, :from => "noreply@railscasts.com", :subject => "Comment Response on Bookshelf"
  end
  
end
