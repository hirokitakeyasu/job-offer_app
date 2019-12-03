class OffersController < ApplicationController
  before_action :target_offer, only: %i[edit update destroy]
  
  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    
    if @offer.save
      redirect_to offers_path, notice: "投稿しました。"
    else
      redirect_to new_offer_path, flash:{
        error_messages: @offer.errors.full_messages
      }
    end
  end
  
  def show
    @offer = Offer.find(params[:id])
  end
  
  def edit
  end
  
  def my_offers
    @offers = current_user.offers
  end
  
  def update
    @offer.update
    redirect_to offer_path(offer.id)
  end
  
  def destroy
    @offer.delete
    redirect_to offers_path
  end

  private

  def offer_params
    params.require(:offer).permit(:name, :title, :body, :user_id)
  end
  
  def target_offer
    @offer = current_user.offers.find(params[:id])
  end

end