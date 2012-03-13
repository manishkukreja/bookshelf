module BooksHelper
  
  def book_video_tag(book)
    video_tag episode.asset_url("videos"), :poster => "/assets/episodes/posters/loading#{800 if episode.legacy?}.png", :width => (episode.legacy? ? 800 : 960), :height => 600
  end
end
