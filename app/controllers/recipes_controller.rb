class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end
    
    def new
        @recipe = Recipe.new
        respond_to do |format|
            format.html # new.html.erb
            format.xml  { render :xml => @recipe }
        end
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = Chef.last
    
        respond_to do |format|
            if @recipe.save
                flash[:success] = 'Recipe was successfully created.'
                format.html { redirect_to(@recipe) }
                format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
            else
                format.html { render :action => "new" }
                format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
            end
        end
    end
    
    def show
        @recipe = Recipe.find(params[:id])
        respond_to do |format|
            format.html # show.html.erb
            format.xml  { render :xml => @recipe }
        end
    end
    
    def edit
        @recipe = Recipe.find(params[:id])
    end
    
    def update
        @recipe = Recipe.find(params[:id])
    
        respond_to do |format|
            if @recipe.update_attributes(recipe_params)
                flash[:success] = 'Recipe was successfully updated.'
                format.html { redirect_to(@recipe) }
                format.xml  { head :ok }
            else
                format.html { render :action => "edit" }
                format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
            end
        end
    end
    
    def destroy
        @recipe = Recipe.find(params[:id])
        @recipe.destroy
    
        respond_to do |wants|
            flash[:success] = 'Recipe was successfully deleted.'
            wants.html { redirect_to(recipes_url) }
            wants.xml  { head :ok }
        end
    end
    
    private
    
    def recipe_params
        params.require(:recipe).permit(:name, :description)
    end
end