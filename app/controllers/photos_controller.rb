class PhotosController < ApplicationController
  require 'flickraw'

  def index
    user_id = params[:user_id]

    # Fetch photos from Flickr using the user_id
    FlickRaw.api_key = 'YOUR_FLICKR_API_KEY'
    FlickRaw.shared_secret = 'YOUR_FLICKR_SHARED_SECRET'
    @photos = flickr.people.getPhotos(user_id: user_id)
  rescue FlickRaw::FailedResponse => e
    flash[:alert] = "Error: #{e.message}"
    @photos = []
  end
end
