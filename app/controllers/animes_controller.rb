class AnimesController < ApplicationController
  def index
    @animes = Anime.all
  end

  def show
    @anime = Anime.find(params[:id])
    @episodes = @anime.episodes.order(:episode_number)
    render layout: 'information'
  end
end
