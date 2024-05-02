class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.movie = @movie
    @bookmark.save
    if @bookmark.save
      redirect_to @lists_path
    else
      render 'bookmarks/new', status: :unprocessable_entity
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
