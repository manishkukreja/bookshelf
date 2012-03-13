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

########INDEX METHODS
 def published?
    published_at <= Time.zone.now
  end
  
  def asset_name
    [padded_position, permalink].join('-')
  end
  
  def padded_position
    position.to_s.rjust(3, "0")
  end
  
  def self.search_published(query, tag_id = nil)
    if APP_CONFIG['thinking_sphinx']
      with = tag_id ? {:tag_ids => tag_id.to_i} : {}
      search(query, :conditions => { :published_at => 0..Time.now.utc.to_i }, :with => with,
                    :field_weights => { :name => 20, :description => 15, :notes => 5, :tag_names => 10 })
    else
      published.primitive_search(query)
    end
  rescue ThinkingSphinx::ConnectionError => e
    APP_CONFIG['thinking_sphinx'] = false
    raise e
  end

  def self.primitive_search(query, join = "AND")
    where(primitive_search_conditions(query, join))
  end
  
  def self.primitive_search_conditions(query, join)
    query.split(/\s+/).map do |word|
      '(' + %w[name description notes].map { |col| "#{col} LIKE #{sanitize('%' + word.to_s + '%')}" }.join(' OR ') + ')'
    end.join(" #{join} ")
  end
  
########END OF INDEX METHODS  
  
   
#######Show Methods
def full_name
    "\##{position} #{name}"
  end
#######  
  
  
end
