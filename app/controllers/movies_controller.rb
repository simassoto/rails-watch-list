class MoviesController < ApplicationController

  def index
    @movies = Movie.all
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

      # no need for app/views/restaurants/create.html.erb
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
      redirect_to restaurant_path(@movie)
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
