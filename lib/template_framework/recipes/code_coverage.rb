# Code Coverage
if RUBY_VERSION >= "1.9"
  apply(templater.recipe('cover_me')) if yes?("\n\nWould you like to add CoverMe for code coverage? [y|n]: ", Thor::Shell::Color::BLUE)
else
  if templater.testing_framework.rspec?
    apply(templater.recipe('rcov')) if yes?("\n\nWould you like to add RCov for code coverage? [y|n]: ", Thor::Shell::Color::BLUE)
  end
end
