class GenresController < ApplicationController
  def all_artists
    Artist.all
  end

  def all_genres
    Genre.all
  end

  def all_songs
    Song.all
  end

  get '/genres/?' do
    erb :'/genres/index.html'
  end

  get '/genres/:slug/?' do
    @genre = Genre.find_by_slug( params[:slug] )
    erb :'/genres/show.html'
  end
end
