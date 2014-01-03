module Torutsume
  module Text
    class TextLoader
      def initialize(repository_loader: _, blame_loader: _, comment_class: _)
        @repository_loader = repository_loader
        @blame_loader = blame_loader
        @comment_class = comment_class
      end

      def load(text)
        repository = @repository_loader.load(text)
        blame = @blame_loader.load(repository, 'body.txt')
        lines = []
        line_number = 1

        blame.each do |hunk|
          hunk.each do |line|
            comments = @comment_class.find_by_text_id_and_commit_id_and_line_number(text.id, line.commit_id, line.orig_line_number)
            lines << ::Torutsume::Text::Line.new(content: line.content.sub(/(\r\n|\r|\n)$/, '').force_encoding('UTF-8'), line_number: line_number, comments: comments, commit_id: line.commit_id, orig_line_number: line.orig_line_number)
            line_number += 1
          end
        end

        ::Torutsume::Text::Text.new(lines: lines)
      end
    end
  end
end
