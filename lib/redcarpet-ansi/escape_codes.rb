module RedcarpetANSI
  module EscapeCodes
    ESC = "\033"

    RESET      = "[0m"
    BRIGHT     = "[1m"
    DIM        = "[2m"
    UNDERSCORE = "[4m"
    BLINK      = "[5m"
    REVERSE    = "[7m"
    HIDDEN     = "[8m"

    FOREGROUND_BLACK   = "[30m"
    FOREGROUND_RED     = "[31m"
    FOREGROUND_GREEN   = "[32m"
    FOREGROUND_YELLOW  = "[33m"
    FOREGROUND_BLUE    = "[34m"
    FOREGROUND_MAGENTA = "[35m"
    FOREGROUND_CYAN    = "[36m"
    FOREGROUND_WHITE   = "[37m"
    FOREGROUND_DEFAULT = "[39m"

    BACKGROUND_BLACK   = "[40m"
    BACKGROUND_RED     = "[41m"
    BACKGROUND_GREEN   = "[42m"
    BACKGROUND_YELLOW  = "[43m"
    BACKGROUND_BLUE    = "[44m"
    BACKGROUND_MAGENTA = "[45m"
    BACKGROUND_CYAN    = "[46m"
    BACKGROUND_WHITE   = "[47m"
    BACKGROUND_DEFAULT = "[49m"

    def self.from_symbol(symbol)
      const_get(symbol.upcase)
    end
  end
end
