namespace :import_book do
  
  task :book => :environment do
    Book.delete_all
    Book.create(:name => "Panchtantra", :description => "Misc stroies for children",:notes=> "Best old stories", :published_at=> "2010-03-01 01:47:00", :position=> 1, :comments_count=> 3, :legacy=> false)
    Book.create(:name => "Jatak Katha", :description => "Animal stroies for children",:notes=> "Best jungle stories", :published_at=> "2010-02-01 01:47:00", :position=> 2, :comments_count=> 31, :legacy=> true)
    Book.create(:name => "Jungle Book", :description => "Story about boy lost in jungle",:notes=> "stories of lost kingdom", :published_at=> "2011-03-01 01:47:00", :position=> 3, :comments_count=> 1, :legacy=> true)
    Book.create(:name => "Superman", :description => "A commic book on super hero from plannet krypton",:notes=> "Adventure of Superman , our first superhero", :published_at=> "2009-03-01 01:47:00", :position=> 4, :comments_count=> 2, :legacy=> false)
    Book.create(:name => "He-Man", :description => "Commic book on the Prince of Eternia",:notes=> "Stories of adventure of most powerful man in the universe", :published_at=> "2010-12-01 01:47:00", :position=> 5, :comments_count=> 5, :legacy=> false)
    Book.create(:name => "Iceage", :description => "Fairy tale commic book",:notes=> "Educational stories for young children", :published_at=> "2010-10-01 01:47:00", :position=> 6, :comments_count=> 3, :legacy=> true)
    Book.create(:name => "Snowy", :description => "Fairy tale on cat",:notes=> "Educational stories for young children", :published_at=> "2010-10-01 01:47:00", :position=> 7, :comments_count=> 3, :legacy=> true)
    Book.create(:name => "Timberland", :description => "Tale on a wood country",:notes=> "Educational stories for young children", :published_at=> "2010-10-01 01:47:00", :position=> 8, :comments_count=> 3, :legacy=> true)
    Book.create(:name => "Gourdville", :description => "Tale about a beautiful city",:notes=> "Educational stories for young children", :published_at=> "2010-10-01 01:47:00", :position=> 9, :comments_count=> 3, :legacy=> true)
    Book.create(:name => "Nani Ma ki Kahaniya", :description => "Fairy tale commic book",:notes=> "Educational stories for young children", :published_at=> "2010-10-01 01:47:00", :position=> 10, :comments_count=> 3, :legacy=> true)
  end
  
  task :tag => :environment do
    Tag.delete_all
    Tag.create(:name =>"Animal Stories")
    Tag.create(:name => "Fairy Tales")
    Tag.create(:name => "Comics")
    Tag.create(:name => "Super Heroes")
    
  end
  
  task :tagging => :environment do
    Tagging.delete_all
    book = Book.all
    tag =Tag.all
    t1=Tagging.create(:book_id => Book.find(book.first.id).id, :tag_id => tag.first.id)
    t2=Tagging.create(:book_id => Book.find(book.first.id + 1).id, :tag_id => tag.first.id)
    t3=Tagging.create(:book_id => Book.find(book.first.id + 2).id, :tag_id => tag.second.id)
    t4=Tagging.create(:book_id => Book.find(book.first.id + 3).id, :tag_id => tag.third.id)
    t5=Tagging.create(:book_id => Book.find(book.first.id + 4).id, :tag_id => tag.fourth.id)
    t6=Tagging.create(:book_id => Book.find(book.first.id + 5).id, :tag_id => tag.first.id)
    t6=Tagging.create(:book_id => Book.find(book.first.id + 6).id, :tag_id => tag.first.id)
    t6=Tagging.create(:book_id => Book.find(book.first.id + 7).id, :tag_id => tag.second.id)
    t6=Tagging.create(:book_id => Book.find(book.first.id + 8).id, :tag_id => tag.fourth.id)
    t6=Tagging.create(:book_id => Book.find(book.first.id + 9).id, :tag_id => tag.third.id)
    
  end
  

  
  
  
end