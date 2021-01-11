class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    Link.create!(title: params[:link][:title], url: params[:link][:url])

    redirect_to root_path
  end
end
