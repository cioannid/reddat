class LinksController < ApplicationController
  def index
    @links = Link.hottest_first
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(title: params[:link][:title], url: params[:link][:url])

    if @link.save
      redirect_to root_path
    else
      render :new
    end
  end
end
