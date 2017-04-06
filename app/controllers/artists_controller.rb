class ArtistsController < ApplicationController
  get '/artists/?' do
    erb :'/artists/index.html'
  end

  get '/artists/:slug/?' do
    @artist = Artist.find_by_slug( params[:slug] )
    erb :'/artists/show.html'
  end
end
