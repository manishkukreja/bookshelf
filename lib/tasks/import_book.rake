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
  
  
end