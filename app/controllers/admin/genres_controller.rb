class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre_new = Genre.new
    @genre_all = Genre.all
  end

  def create
    @genre_new = Genre.new(genre_params)

    if @genre_new.save
      redirect_to admin_genres_path
    else
      redirect_to admin_genres_path
    end
  end

  def edit
    @genre_edit_target = Genre.find(params[:id])
  end

  def update
    @genre_update_target = Genre.find(params[:id])

    if @genre_update_target.update(genre_params)
      redirect_to admin_genres_path
    else
      flash[:alert] = "ジャンル情報を更新できませんでした。"
      redirect_to edit_admin_genre_path
    end
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end

end
