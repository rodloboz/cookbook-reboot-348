

require_relative 'view'

# This class is use to run actions which may involved
# the view (displaying ans getting info to and from the user)
# and the model (the data layer)
class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    # ask user for name
    name = @view.ask_user_for(:name)
    # ask user for description
    description = @view.ask_user_for(:description)
    # create a new Recipe instance
    recipe = Recipe.new(name, description)
    # tell the Cookbook to store new recipe
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # display list of recipes
    display_recipes
    # ask user for index to be removed
    indexes = (1..@recipes.length)
    index = @view.ask_user_for_index(indexes)
    # tell the cookbook to remove that recipe
    @cookbook.remove_recipe(index)
  end

  private

  def display_recipes
    # list all of the recipes
    # ask the cookbook for all recipes
    @recipes = @cookbook.all
    # send recipes to the view for displaying
    @view.display(@recipes)
  end
end





