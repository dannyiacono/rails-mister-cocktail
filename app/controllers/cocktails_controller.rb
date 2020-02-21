class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(set_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_params
    params[:cocktail].permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
