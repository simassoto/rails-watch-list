class MoviesController < ApplicationController
  before_action :authenticate_user!, only: :toggle_favorite

  def toggle_favorite
    @movie = Movie.find_by(id: params[:id])
    current_user.favorited?(@movie)  ?current_user.unfavorite(@movie) : current_user.favorite(@movie)
  end


  def index
    @movies = Movie.all
    @favorite_movies = current_user.favorited_by_type('Movie')
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end


  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movie_path(@movie)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url)
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to movie_path(@movie)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path
  end
end
