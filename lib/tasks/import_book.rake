namespace :import_book do
  
  task :book => :environment do
    Book.delete_all
    Book.create(:name => "Panchtantra", :description => "Misc stroies for children")
    Book.create(:name => "Jatak Katha", :description => "Animal stroies for children")
    Book.create(:name => "Jungle Book", :description => "Story about boy lost in jungle")
    Book.create(:name => "Superman", :description => "A commic book on super hero from plannet krypton")
    Book.create(:name => "He-Man", :description => "Commic book on the Prince of Eternia")
    Book.create(:name => "Nani Ma ki Kahaniya", :description => "Fairy tale commic book")
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
    t1=Tagging.create(:book_id => book.first.id, :tag_id => tag.first.id)
    t2=Tagging.create(:book_id => book.second.id, :tag_id => tag.first.id)
    t3=Tagging.create(:book_id => book.third.id, :tag_id => tag.second.id)
    t4=Tagging.create(:book_id => book.fourth.id, :tag_id => tag.third.id)
    t5=Tagging.create(:book_id => book.fifth.id, :tag_id => tag.fourth.id)
    t6=Tagging.create(:book_id => book.fifth.id, :tag_id => tag.first.id)
    
  end
  
end