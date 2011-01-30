if yes?("\n[Stylesheets] Would you like to use Sass for Syntactically Awesome Stylesheets? [y|n]: ", Thor::Shell::Color::BLUE)

  # gem 'sass' # TODO: Wait until Sass 3.1 is released
  gem 'haml'

  if yes?("\nWould you like to use Compass? [y|n]: ", Thor::Shell::Color::BLUE)
    design_options = {
      'Option' => 'Design Framework',
      '1' => 'Compass',
      '2' => 'Compass with blueprint semantic',
      '3' => 'Compass with blueprint basic'
    }

    print_table design_options.to_a, :ident => 4
    design_selection = ask("\nOption: ", Thor::Shell::Color::BLUE)

    design_framework = case design_selection
      when "1"
        :compass
      when "2"
        :compass_blueprint_semantic
      when "3"
        :compass_blueprint
      else
        :none
    end

    unless design_framework == :none
      gem 'compass'

      compass_sass_dir = "app/stylesheets"
      compass_css_dir = "public/stylesheets/compiled"
      blueprint_option = case design_framework
        when :compass_blueprint
          "--using blueprint/basic"
        when :compass_blueprint_semantic
          "--using blueprint/semantic"
      end

      compass_command = "compass init rails . #{blueprint_option} --css-dir=#{compass_css_dir} --sass-dir=#{compass_sass_dir} "

      templater.post_bundler do
        run compass_command
      end

    end
  end
end
