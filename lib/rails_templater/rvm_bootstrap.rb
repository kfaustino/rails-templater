require 'thor/shell'

module RailsTemplater
  class RvmBootstrap

    def self.init(application_name)
      return unless require_rvm!

      thor = Thor::Shell::Basic.new
      return unless thor.yes?("\nWould you like to use RVM? [y|n]: ", Thor::Shell::Color::BLUE)

      thor.say "\nWhich Ruby would you like to use?\n", Thor::Shell::Color::BLUE
      ruby_options = { 'Option' => 'Ruby' }
      installed_rubies.each_with_index do |ruby, idx|
        ruby_options[idx+1] = ruby + "#{' [default]' if ruby == current_ruby}"
      end
      thor.print_table ruby_options.to_a, :ident => 4
      ruby_selection = thor.ask("\nOption: ", Thor::Shell::Color::BLUE)
      ruby_selection = ruby_selection.blank?? current_ruby : installed_rubies[ruby_selection.to_i-1]

      thor.say "\nWhich Gemset would you like to use?\n", Thor::Shell::Color::BLUE
      gemset_selection = thor.ask("\nGemset [default: #{application_name}]: ", Thor::Shell::Color::BLUE)
      gemset_selection = application_name if gemset_selection.empty?

      thor.say "Initializing rvm gemset #{ruby_selection}@#{gemset_selection}"
      env = RVM::Environment.new(current_ruby)
      env.gemset_create(gemset_selection)
      env.gemset_use!(gemset_selection)

      %w(bundler rails).each do |gem_name|
        unless installed_gems.include? gem_name
          thor.say "Installing #{gem_name} gem..."
          thor.say "Successfully installed #{gem_name}" if system("gem", "install", gem_name)
        end
      end
    end

    protected

    def self.current_ruby
      /([^@]+)/ =~ environment_name
      $1
    end

    def self.environment_name
      require_rvm!
      RVM::Environment.current.environment_name
    end

    def self.installed_gems
      `gem list`.split("\n").map { |gem| /([^ ]+)/ =~ gem; $1 }
    end

    def self.installed_rubies
      rubies = RVM::Environment.current.list.rubies
    end

    def self.require_rvm!
      begin
        rvm_lib_path = "#{`echo $rvm_path`.strip}/lib"
        $LOAD_PATH.unshift(rvm_lib_path) unless $LOAD_PATH.include?(rvm_lib_path)
        require 'rvm'
      rescue LoadError
        return false
      end
    end

  end
end
