class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.save
    redirect_to offers_path, notice: "投稿しました。"
  end
  
  def show
    @offer = Offer.find(params[:id])
  end
  
  def edit
    @offer = Offer.find(params[:id])
  end
  
  def update
    @offer = Offer.find(params[:id])
    @offer.update
    redirect_to offer_path(offer.id)
  end
  

  private

  def offer_params
    params.require(:offer).permit(:name, :title, :body)
  end

end