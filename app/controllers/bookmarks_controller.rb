class BookmarksController < ApplicationController

  before_action :prepare_book

  def new
    # byebug
    @reading = Reading.find(params[:reading_id])
    @bookmark = @reading.bookmarks.new
  end

  def create
    # byebug
    @bookmark = @reading.bookmarks.build(bookmark_params)
    # @bookmark.reading_id = bookmark_params[:reading_id]
    if @bookmark.save
      redirect_to reading_bookmarks_path
    else
      render:new
    end
  end

  def index
    @bookmarks = Bookmark.where(reading_id: params[:reading_id])
  end

  def destroy
    # byebug
    Bookmark.destroy(params[:id])
    redirect_to reading_bookmarks_path
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.update(bookmark_params)
      redirect_to reading_bookmarks_path
    else
      render :edit
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:page_number, :description, :reading_id)
  end

  def prepare_book
    @reading = Reading.find(params[:reading_id])
  end

end
