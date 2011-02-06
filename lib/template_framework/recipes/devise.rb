if yes?("\n[User authentication] Would you like to add flexible user authentication with Devise? [y|n]: ", Thor::Shell::Color::BLUE)

  gem 'devise'

  model_name = ask('Name of Devise model? [user]: ', Thor::Shell::Color::BLUE)
  model_name = 'user' if model_name.blank?

  generate_views = yes?('Generate Devise views? [y|n]: ', Thor::Shell::Color::BLUE)
  devise_views_command = "devise:views -e #{templater.template_engine.type}"

  # hpricot is required for haml or slim views, haml2slim is required for slim
  if generate_views && (templater.template_engine.haml? || templater.template_engine.slim?)
    gem 'hpricot'
    gem 'ruby_parser' if templater.template_engine.haml?
    gem 'haml2slim' if templater.template_engine.slim?
  end

  templater.post_bundler do
    generate "devise:install"
    generate "devise #{model_name}"
    generate devise_views_command if generate_views

    inject_into_file 'config/environments/development.rb',
      "\n  config.action_mailer.default_url_options = { :host => 'localhost:3000' }\n",
      :after => "  config.action_mailer.raise_delivery_errors = false\n"

    inject_into_file "app/models/#{model_name.downcase}.rb",
      "  attr_accessible :email, :password, :password_confirmation\n",
      :before => 'end'

    if templater.testing_framework.rspec?
      inject_into_file 'spec/spec_helper.rb',
        "  config.include Devise::TestHelpers, :type => :controller\n",
        :after => "# config.use_transactional_fixtures = true\n"
    end
  end
end
