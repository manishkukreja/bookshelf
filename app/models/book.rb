class Book < ActiveRecord::Base
  has_many :taggings
  has_many :tags, :through => :taggings
  
  
  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :tagged, lambda { |tag_id| tag_id ? joins(:taggings).where(:taggings => {:tag_id => tag_id}) : scoped }
  scope :recent, order('position DESC')
  
  
  def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

 def published?
    published_at <= Time.zone.now
  end
  
  
end
