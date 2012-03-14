module RailsTemplater
  class FixtureReplacement

    DEFAULT = :factory_girl
    SUPPORTED_TYPES = [:factory_girl, :fabrication]

    def type
      @type || DEFAULT
    end

    def type=(value)
      raise NotSupportedError unless SUPPORTED_TYPES.include?(value)
      @type = value
    end

    SUPPORTED_TYPES.each do |type|
      define_method "#{type}?" do
        self.type == type
      end
    end
  end
end