class CocktailsController < ApplicationController
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
    @cocktail = Cocktail.new(cocktail_params)
    # @dose = Dose.new(dose_params)
    # @doses = @cocktail.doses
    # @dose.cocktail = @cocktail

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end


  def update
     @cocktail = Cocktail.find(params[:id])
     @cocktail.update(cocktail_params)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
  end

   private

   def cocktail_params
     params.require(:cocktail).permit(:name)
   end

   def dose_params
     params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
   end
end
