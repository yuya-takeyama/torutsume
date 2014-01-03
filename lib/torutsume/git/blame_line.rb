module Torutsume
  module Git
    class BlameLine
      attr_accessor :file, :commit_id, :line_number, :content

      def initialize(file: _, commit_id: _, line_number: _, content: _)
        @file = file
        @commit_id = commit_id
        @line_number = line_number
        @content = content
      end
    end
  end
end
