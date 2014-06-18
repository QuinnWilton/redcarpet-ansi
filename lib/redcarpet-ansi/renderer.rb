require 'redcarpet-ansi/escape_codes'
require 'redcarpet-ansi/header_styler'
require 'redcarpet-ansi/text_styler'

module RedcarpetANSI
  class Renderer < Redcarpet::Render::Base
    
    # tab character will depend on their terminal
    # settings, and most people have the wrong settings.
    TAB = '  '
      
    def header(text, level)
      case level
      when 1
        HeaderStyler.style(text, :large) + "\n"
      when 2
        HeaderStyler.style(text, :medium) + "\n"
      when 3
        HeaderStyler.style(text, :small) + "\n"
      end
    end
    
    def triple_emphasis(text)
      double_emphasis(text)
    end

    def double_emphasis(text)
      TextStyler.style(text, :blink)
    end

    def emphasis(text)
      TextStyler.style(text, :bright)
    end
    
    def underline(text)
      TextStyler.style(text, :underscore)
    end

    def paragraph(text)
      text + "\n\n"
    end
    
    def block_code(code, language)
      indented_code = code.split("\n").map { 
        |x| "#{TAB}#{TAB}#{x}"
      }.join("\n")
      
      "\n#{TAB}#{language}:\n" + indented_code + "\n\n"
    end
    
    def block_quote(quote)
      indented_quote = quote.split("\n").map { 
        |x| "#{TAB}#{x}"
      }.join("\n")
      
      indented_quote + "\n\n"
    end
    
    def block_html(raw_html)
      block_code(raw_html, 'html')
    end
    
    def list(content, list_type)
      case list_type
      when :ordered
        content
      when :unordered
        content
      end
    end

    def list_item(content, list_type)
      case list_type
      when :ordered
        "#{TAB}- #{content.strip}\n"
      when :unordered
        "#{TAB}- #{content.strip}\n"
      end
    end
    
    def linebreak
      "\n"
    end

    def link(link, title, content)
      content
    end

    def image(link, title, content)
      ""
    end
  end
end
