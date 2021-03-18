class Api::V1::LinksController < ApplicationController
  def index
    links = Link.hottest_first

    render json: links, adapter: :json
  end
end
