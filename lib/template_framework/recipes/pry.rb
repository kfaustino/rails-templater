if yes?("\n[Console] Pry over IRB for your Rails console? [y|n]: ", Thor::Shell::Color::BLUE)
  gem 'pry-rails', group: :development
  gem 'pry-nav', group: :development
end