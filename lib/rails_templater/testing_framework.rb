module RailsTemplater
  class TestingFramework
    
    DEFAULT = :rspec
    SUPPORTED_TYPES = [:rspec, :test_unit]
    
    def type
      @testing_framework || DEFAULT
    end
    
    def type=(value)
      raise NotSupportedError unless SUPPORTED_TYPES.include?(value)
      @testing_framework ||= value
    end
    
    SUPPORTED_TYPES.each do |type|
      define_method "#{type}?" do
        @testing_framework == type
      end
    end
    
  end
end