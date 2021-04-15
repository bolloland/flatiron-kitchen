class IngredientsController < ApplicationController
before_action :set_ingredient, only:[:edit, :show, :update, :delete]

    def index
        @ingredients = Ingredient.all
    end

    def new
        @ingredient = Ingredient.new
    end

    def show

    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
      redirect_to ingredient_path(@ingredient)
        else
          render :new
        end
    end

    def edit 
    end

    def update
        @ingredient.update(name: params[:ingredient][:name])
        redirect_to ingredient_path(@ingredient) #show page
    end

    def delete
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

    def set_ingredient
        @ingredient = Ingredient.find_by_id(params[:id])
    end


end
