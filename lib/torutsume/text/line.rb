module Torutsume
  module Text
    class Line
      attr_reader :content, :line_number, :comments, :commit_id, :orig_line_number

      def initialize(content: _, line_number: _, comments: _, commit_id: _, orig_line_number: _)
        @content = content
        @line_number = line_number
        @comments = comments
        @commit_id = commit_id
        @orig_line_number = orig_line_number
      end
    end
  end
end
