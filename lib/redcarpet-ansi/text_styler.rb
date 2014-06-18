module RedcarpetANSI
  module TextStyler

    def self.style(text, style)
      tag(style) + text + tag(:reset)
    end

    def self.tag(style)
      RedcarpetANSI::EscapeCodes::ESC +
      RedcarpetANSI::EscapeCodes.from_symbol(style)
    end
  end
end
