class BandsController < ApplicationController

    def index 
        @bands = Band.all
        render :index 
    end

    def new
        render :new
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to band_url(@band)
        else
            render :new
            flash.now[:errors] = @band.errors.full_messages
        end
    end

    def edit
        render :edit
    end

    def update
        @band = Band.find(params[:id])
        if @band.update(band_params)
            redirect_to band_url(@band)
        else
            render :edit
            flash.now[:errors] = @band.errors.full_messages
        end
    end
        
    def show
        @band = Band.find(params[:id])
        render :show
    end
end
