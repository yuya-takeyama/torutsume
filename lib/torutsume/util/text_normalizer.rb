module Torutsume
  module Util
    class TextNormalizer
      def normalize_multiple_lines(text)
        text = text.gsub(/\r\n|\r/, "\n").gsub(/\n+$/, "\n")
        text += "\n" if text[-1] != "\n"
        text
      end
    end
  end
end
