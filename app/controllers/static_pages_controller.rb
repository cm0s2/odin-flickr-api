class StaticPagesController < ApplicationController
  def index
    if params[:user_id].present?
      flickr = Flickr.new ENV['flickr_api_key'], ENV['flickr_shared_secret']
      result = flickr.photos.search(user_id: params[:user_id])

      # https://live.staticflickr.com/{server-id}/{id}_{secret}.jpg
      @image_urls = result.map { |item| "https://live.staticflickr.com/#{item.server}/#{item.id}_#{item.secret}.jpg" }
    end
  end
end
