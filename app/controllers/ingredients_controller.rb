class IngredientsController < ApplicationController

    before_action :set_ingredient, only: [:edit, :update]
    def new 
        @ingredient = Ingredient.new 

    end

    def show 
        @ingredient = Ingredient.find(params[:id])
    end

    def index 
        @ingredients = Ingredient.all 
    end

    def create 
        ingredient = Ingredient.new(ingredient_params)

        if ingredient.save 
            redirect_to ingredients_path
        else 
            render :new 
        end 
    end

    def edit 
    end

    def update 
        if @ingredient.update(ingredient_params)
            redirect_to ingredients_path(@ingredient)
        else 
            render :edit 
        end
    end

    private 

    def set_ingredient 
        @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params 
        params.require(:ingredient).permit!
    end

end
