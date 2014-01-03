module Torutsume
  module Git
    class RepositoryCreator
      def initialize(repository_class: _, repository_path_finder: _)
        @repository_class = repository_class
        @repository_path_finder = repository_path_finder
      end

      def create(text)
        @repository_class.init_at(@repository_path_finder.find(text), :bare)
      end
    end
  end
end
