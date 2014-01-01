module Torutsume
  module Git
    class RepositoryCreator
      def initialize(repository_class: repository_class, repository_path_finder: path_finder)
        @repository_path_finder = repository_path_finder
        @repository_class = repository_class
      end

      def create(text)
        path = @repository_path_finder.find(text)
        @repository_class.init_at(path, :bare)
      end
    end
  end
end
