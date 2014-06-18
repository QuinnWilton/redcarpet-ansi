require 'artii'

module RedcarpetANSI
  module HeaderStyler
    
    LARGE_FONT  = 'slant'
    MEDIUM_FONT = 'big'
    SMALL_FONT  = 'straight'

    def self.style(text, size)
      font  = font_from_size(size)
      
      artii = Artii::Base.new(font: font)
      artii.asciify(text)
    end
    
    def self.font_from_size(size)
      const_get("#{size.upcase}_FONT")
    end
  end
end
