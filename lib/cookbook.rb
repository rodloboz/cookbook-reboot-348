require 'csv'

# This class is used to store all instances of Recipes
# and to add, and remove Recipes
class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load_csv
  end

  # This method is used to return the list of Recipes
  #   Cookbook.new.all => [Recipe, Recipe, Recipe]
  def all
    @recipes
  end

  # This method is used to add a Recipe instance to
  # the list of @recipes
  #   Cookbook.new.add_recipe(Recipe.new("Cake", "Cake description"))
  def add_recipe(recipe)
    @recipes << recipe
    write_csv
  end

  # This method is used to remove a Recipe instance
  # from the list of recipes with an index
  #   Cookbook.new.remove_Recipe(4)
  def remove_recipe(index)
    @recipes.delete_at(index)
    write_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new(row.first, row.last)
    end
  end

  def write_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << recipe.to_csv_row
      end
    end
  end
end


# class Sailboat
#   # Class method
#   # Does not need an instance in order to work
#   # Sailboat.types
#   def self.types
#     []
#   end

#   # Instance method:
#   # Needs an instance in order to work
#   # Sailboat.new.displacement
#   def displacement
#     # ...
#   end
# end
