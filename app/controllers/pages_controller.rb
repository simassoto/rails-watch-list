class PagesController < ApplicationController

  def profile
    @user = current_user
    @favorite_movies = current_user.favorited_by_type('Movie')
    @favorite_lists = current_user.favorited_by_type('List')

  end
end
