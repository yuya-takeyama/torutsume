module Torutsume
  module Git
    class RepositoryCreator
      attr_reader :error

      def initialize(repository_class: repository_class, repository_path_finder: path_finder)
        @repository_path_finder = repository_path_finder
        @repository_class = repository_class
      end

      def create(text)
        path = @repository_path_finder.find(text)

        begin
          repository = @repository_class.init_at(path, :bare)
        rescue => e
          @error = e
          return nil
        end

        repository
      end
    end
  end
end
