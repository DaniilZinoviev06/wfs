class EpisodesController < ApplicationController
  def show
    @anime = Anime.find(params[:anime_id])
    @episode = @anime.episodes.find_by!(episode_number: params[:episode_number])
  end
end
