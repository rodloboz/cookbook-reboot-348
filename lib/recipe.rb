

# This class described the Recipe model
class Recipe
  attr_reader :name, :description

  # This method is called when a new instance gets created
  #   Recipe.new('Cake', 'Chocolate Cake..')
  def initialize(name, description)
    # Instance variables, used to store internal state/data
    @name = name
    @description = description
  end

  def to_csv_row
    [name, description]
  end

  # Public Interface
  # We can replace this with attr_reader
  # def name
  #   @name
  # end
  #
  # def description
  #  @description
  # end
end
