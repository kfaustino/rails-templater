if yes?("\n\nWould you like to add user authentication with Devise? [y|n]: ", Thor::Shell::Color::BLUE)
  apply(templater.recipe('devise'))
end

if yes?("\n\nWould you like to add authorization with CanCan? [y|n]: ", Thor::Shell::Color::BLUE)
  apply(templater.recipe('cancan'))
end
