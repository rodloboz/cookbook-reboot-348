
# This class is used to print or display
# information to the screen and to get
# or receive information from the user
class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}) Name: #{recipe.name} | Description: #{recipe.description}"
    end
  end

  def ask_user_for(attribute)
    puts "What's the #{attribute} of the recipe?"
    print "> "
    gets.chomp
  end

  def ask_user_for_index(range)
    first, *rest, last = (1..10).to_a
    puts "What's the recipe you want to remove? (#{first}-#{last})"
    print "> "
    # converting to the real index
    gets.chomp.to_i - 1
  end
end
