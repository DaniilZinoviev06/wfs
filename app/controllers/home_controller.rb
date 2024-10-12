class HomeController < ApplicationController
  def index
    @animes = Anime.limit(2)
  end
end
