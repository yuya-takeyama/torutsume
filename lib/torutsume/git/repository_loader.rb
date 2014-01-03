module Torutsume
  module Git
    class RepositoryLoader
      def initialize(repository_class: _, repository_path_finder: _)
        @repository_class = repository_class
        @repository_path_finder = repository_path_finder
      end

      def load(text)
        @repository_class.new(@repository_path_finder.find(text))
      end
    end
  end
end
