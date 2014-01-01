module Torutsume
  module Text
    class PostResult
      attr_reader :text, :error

      def initialize(status: true, text: _, error: nil)
        @status = status
        @text   = text
        @error  = error
      end

      def ok?
        !!@status
      end

      def error?
        not ok?
      end
    end
  end
end
