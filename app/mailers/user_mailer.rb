class UserMailer < ActionMailer::Base
  
  def feedback(message)
    @message = message
    mail(:to => "manishkukreja@gmail.com", :from => @message.email, :subject => "Bookshelf Feedback from #{@message.name}")
  end

  def comment_response(comment, user)
    @comment = comment
    @user = user
    mail :to => @user.email, :from => "manishkukreja@gmail.com", :subject => "Comment Response on Bookshelf"
    #mail :to => "ravi.kukreja@gmail.com", :from => "manishkukreja@gmail.com", :subject => "Comment Response on Bookshelf"
  end
  
end
