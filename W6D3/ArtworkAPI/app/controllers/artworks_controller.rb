class ArtworksController < ApplicationController
  def index
    artwork = Artwork.where(artist_id: params[:user_id]).or(Artwork.where(shared_viewers: params[:user_id]))
    render json: artwork
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: params
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      redirect_to artwork_url
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.delete
    render json: artwork
  end



  private
  def artwork_params
    params.require(:artwork).permit(:artist_id)
  end
end
