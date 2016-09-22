class ListingsController < ApplicationController


  def index
    if params[:tag]
      @listings = Listing.tagged_with(params[:tag])
    else
      @listings = Listing.all.order("created_at DESC")
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to listings_path
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      redirect_to listings_path, notice: "Listing was Successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  private

  def listing_params   
    params.require(:listing).permit(:user_id, :title, :description, :country, :state, :address, :pet, :smoking, :max_guest, :price, :tag_list, {images:[]})
  end


end
