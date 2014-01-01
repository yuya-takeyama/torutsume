module Torutsume
  module Git
    class RepositoryCreator
      attr_reader :error

      def initialize(repository_class: _, repository_path_finder: _, commit_writer: _)
        @repository_path_finder = repository_path_finder
        @repository_class = repository_class
        @commit_writer = commit_writer
      end

      def create(user: user, text: text)
        path = @repository_path_finder.find(text)

        begin
          repo  = @repository_class.init_at(path, :bare)
          @commit_writer.write(repository: repo, user: user, text: text)

          repo
        rescue => e
          @error = e
          nil
        end
      end
    end
  end
end
