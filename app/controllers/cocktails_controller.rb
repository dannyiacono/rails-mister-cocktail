class CocktailsController < ApplicationController
  # before_action :set_cocktail
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(set_params)
    @cocktail.save!
    redirect_to cocktails_path
  end

  private

  def set_params
    params[:cocktail].permit(:name)
  end

  def set_cocktail
  end
end
