class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:toggle_favorite, :create, :destroy]

  def toggle_favorite
    @list = List.find_by(id: params[:id])
    current_user.favorited?(@list)  ?current_user.unfavorite(@list) : current_user.favorite(@list)
  end

  def index
    @lists = List.all

  end

  def show

    @list = List.find(params[:id])
    @user = @list.user
    @username = @user.username
    @bookmark = Bookmark.new
    @review = Review.new(list: @list)
  end

  def new
   @list = List.new
  end

  def create

    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
        redirect_to list_path(@list)
      else
        render :new
      end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
