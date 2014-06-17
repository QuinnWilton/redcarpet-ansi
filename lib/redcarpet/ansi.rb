require 'redcarpet/ansi/version'
require 'redcarpet'

module Redcarpet
  module Render
    class ANSI < Base
      
      # Methods where the first argument is the text content
      [
        # block-level calls
        :block_code, :block_quote,
        :block_html, :list, :list_item,

        # span-level calls
        :autolink, :codespan, 
        :underline, :raw_html,
        :triple_emphasis, :strikethrough,
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

      def double_emphasis(text)
        "\e[5m" + text + "\e[0m"
      end

      def emphasis(text)
        "\e[1m" + text + "\e[0m"
      end

      # Other methods where the text content is in another argument
      def link(link, title, content)
        content
      end

      def image(link, title, content)
        content &&= content + " "
        "#{content}#{link}"
      end

      def paragraph(text)
        text + "\n"
      end

      def header(text, header_level)
        text + "\n"
      end
    end
  end
end
