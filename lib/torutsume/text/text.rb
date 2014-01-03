module Torutsume
  module Text
    class Text
      attr_reader :lines

      def initialize(lines: _)
        @lines = lines
      end

      def each(&block)
        @lines.each(&block)
      end
    end
  end
end
