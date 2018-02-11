require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
    
    test "should get respes index" do
        get recipes_url
        assert_response :success
    end
    
    test "create new valid recipe" do
        get new_recipe_path
        # assert_template 'recipes/new'
        # name_of_recipe = "Chicke salad"
        # description_of_recipe = "Add chicken salad"
        # assert_difference "Recipe.count", 1 do 
        #     post recipes_path, params: {recipe: {name: name_of_recipe, description: description_of_recipe}}
        # end
        # follow_redirect!
        # assert_match name_of_recipe.capitalize, response.body
        # assert_match description_of_recipe, response.body
    end
    
    test "rejet invalid recipe submission" do 
        get new_recipe_path
        assert_template 'recipes/new'
        assert_no_difference "Recipe.count" do 
            post recipes_path, params: {recipe: {name: "SASA", description: "SASA"}}
        end
        assert_template 'recipes/new'
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
    end
    
    
    
end