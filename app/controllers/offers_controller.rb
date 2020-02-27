class OffersController < ApplicationController
  before_action :target_offer, only: %i[show edit update destroy]
  
  def index
    @q = Offer.with_keywords(params.dig(:q, :keywords)).ransack(params[:q])
    @offers = @q.result.page(params[:page])
    
    @offers = params[:tag_id].present? ? Tag.find(params[:tag_id]).offers : Offer.all
    @offers = @offers.page(params[:page])
  end

  def new
    @offer = Offer.new(flash[:offer])
  end

  def create
    @offer = current_user.offers.new(offer_params)
    @offer.user_id = current_user.id
    
    if @offer.save
      flash[:success] = "投稿しました。"
      redirect_to offers_path
    else
      redirect_to new_offer_path, flash:{
        error_messages: @offer.errors.full_messages
      }
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def my_offers
    @offers = current_user.offers
  end
  
  def favorites_offers
    @offers = current_user.offers
  end
  
  def update
    if @offer.update(offer_params)
      flash[:success] = "投稿を更新しました。"
      redirect_to offers_my_offers_path
    end
  end
  
  def destroy
    if @offer.destroy
      flash[:success] = "投稿を削除しました。"
      redirect_to offers_my_offers_path
    end
  end
  
  private

  def offer_params
    params.require(:offer).permit(:name, :title, :body, :user_id, :image, tag_ids: [])
  end
  
  def target_offer
    @offer = Offer.find(params[:id])
  end

end