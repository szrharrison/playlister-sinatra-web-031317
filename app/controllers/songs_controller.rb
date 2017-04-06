class SongsController < ApplicationController
  get '/songs/?' do
    erb :'/songs/index.html'
  end

  get '/songs/new/?' do
    erb :'/songs/new.html'
  end

  post '/songs/?' do
    @song = Song.create( params[:song] )
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by( params[:artist] )
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.find_or_create_by( params[:genre] )
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{ @song.slug }"
  end

  get '/songs/:slug/edit/?' do
    @song = Song.find_by_slug( params[:slug] )
    erb :'/songs/edit.html'
  end

  patch '/songs/:slug/?' do
    @song = Song.find_by_slug( params[:slug] )
    @song.update( params[:song] )
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by( params[:artist] )
    end
    if !params[:genre][:name].empty?
      @song.genres << Genre.find_or_create_by( params[:genre] )
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{ @song.slug }"
  end

  get '/songs/:slug/?' do
    @song = Song.find_by_slug( params[:slug] )
    erb :'/songs/show.html'
  end
end
