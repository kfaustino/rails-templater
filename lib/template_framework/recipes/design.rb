say "Would you like to use a design framework?\n", Thor::Shell::Color::BLUE
print_table [ ['Option','Framework'], ['1', 'Compass with blueprint semantic'] ], :ident => 2
design_input = ask("Option: ", Thor::Shell::Color::BLUE)
templater.template_options[:design] = case design_input
  when "1"
    :compass
  else
    :none
end

if templater.template_options[:design] == :compass
  gem 'compass'

  # TODO: support more than one framework from compass
  compass_sass_dir = "app/stylesheets"
  compass_css_dir = "public/stylesheets/compiled"

  compass_command = "compass init rails . --using blueprint/semantic --css-dir=#{compass_css_dir} --sass-dir=#{compass_sass_dir} "

  templater.post_bundler do
    puts "Beginning Compass setup"
    run compass_command
    puts "Compass has been setup"
  end

end
