require 'redcarpet-ansi/escape_codes'
require 'redcarpet-ansi/header_styler'
require 'redcarpet-ansi/text_styler'

module RedcarpetANSI
  class Renderer < Redcarpet::Render::Base
      
    # We strip most elements to be plaintext
    [
      # block-level calls
      :block_code, :block_quote,
      :block_html, :list, :list_item,

      # span-level calls
      :autolink, :codespan,
      :raw_html, :strikethrough,
      :superscript,

      # footnotes
      :footnotes, :footnote_def, :footnote_ref,

      # low level rendering
      :entity, :normal_text
    ].each do |method|
      define_method method do |*args|
        args.first
      end
    end

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

    def link(link, title, content)
      content
    end

    def image(link, title, content)
      content
    end

    def paragraph(text)
      "\n" + text + "\n"
    end
  end
end
