module Torutsume
  module Git
    class BlameLoader
      def initialize(blame_class: _, commit_class: _, blob_class: _)
        @blame_class = blame_class
        @commit_class = commit_class
        @blob_class = blob_class
      end

      def load(repo, file)
        rugged_blame = @blame_class.new(repo, file)

        rugged_blame.map do |hunk|
          final_commit_id        = hunk[:final_commit_id]
          orig_start_line_number = hunk[:orig_start_line_number]
          lines_in_hunk          = hunk[:lines_in_hunk]

          commit = @commit_class.lookup(repo, final_commit_id)
          tree   = commit.tree
          oid    = tree.find {|info| info[:name] == file }[:oid]
          blob   = @blob_class.lookup(repo, oid)

          lines       = blob.content.lines[(orig_start_line_number - 1), lines_in_hunk]
          line_number = orig_start_line_number

          lines.map do |line|
            line = ::Torutsume::Git::BlameLine.new(file: file, commit_id: final_commit_id, line_number: line_number, content: line)
            line_number += 1
            line
          end
        end
      end
    end
  end
end
