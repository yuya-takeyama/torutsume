module Torutsume
  module Util
    class TextNormalizer
      def normalize_multiple_lines(text)
        return nil if text.nil?

        text = text.gsub(/\r\n|\r/, "\n").gsub(/\n+\Z/, "\n")
        text += "\n" if text[-1] != "\n"
        text
      end
    end
  end
end
