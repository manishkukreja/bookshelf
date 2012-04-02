class User < ActiveRecord::Base
  attr_accessible :name, :email, :site_url, :email_on_reply
  acts_as_authentic
  has_many :comments
  
end
