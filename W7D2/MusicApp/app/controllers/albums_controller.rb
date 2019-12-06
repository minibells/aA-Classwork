class AlbumsController < ApplicationController
     def new
        render :new
    end

    def create
        @album = Album.new(album_params)
        if @album.save
            redirect_to album_url(@album)
        else
            render :new
            flash.now[:errors] = @album.errors.full_messages
        end
    end

    def edit
        render :edit
    end

    def update
        @album = Album.find(params[:id])
        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            render :edit
            flash.now[:errors] = @album.errors.full_messages
        end
    end
        
    def show
        @album = Album.find(params[:id])
        render :show
    end
end
