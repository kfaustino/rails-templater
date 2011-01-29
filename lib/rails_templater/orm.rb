module RailsTemplater
  class Orm
    
    class NotSupportedError < Exception; end
    
    DEFAULT = :mongoid
    SUPPORTED_TYPES = [:active_record, :mongoid]

    def type
      @orm || DEFAULT
    end
    
    def type=(value)
      raise NotSupportedError unless SUPPORTED_TYPES.include?(value)
      @orm = value
    end
    
    SUPPORTED_TYPES.each do |orm|
      define_method "#{orm}?" do
        @orm == orm
      end
    end      
    
  end
end