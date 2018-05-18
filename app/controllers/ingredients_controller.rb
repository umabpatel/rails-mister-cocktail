class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.find(params[:id])
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end


  def update
     @ingredient = Ingredient.find(params[:id])
     @cocktail.update(ingredient_params)
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
  end

   private

   def ingredient_params
     params.require(:ingredient).permit(:name)
   end
end
