module RailsTemplater
  class TemplateEngine

    DEFAULT = :haml
    SUPPORTED_TYPES = [:haml, :slim, :erb]

    def type
      @type || DEFAULT
    end

    def type=(value)
      raise NotSupportedError unless SUPPORTED_TYPES.include?(value)
      @type ||= value
    end

    SUPPORTED_TYPES.each do |type|
      define_method "#{type}?" do
        self.type == type
      end
    end
  end
end
