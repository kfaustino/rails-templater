module RailsTemplater
  class RvmBootstrap

    def self.init(gemset_name)
      return unless require_rvm!

      puts "Initializing rvm gemset #{current_ruby}@#{gemset_name}"
      env = RVM::Environment.new(current_ruby)
      env.gemset_create(gemset_name)
      env.gemset_use!(gemset_name)

      %w(bundler rails).each do |gem_name|
        unless installed_gems.include? gem_name
          puts "Installing #{gem_name} gem..."
          puts "Successfully installed #{gem_name}" if system("gem", "install", gem_name)
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
