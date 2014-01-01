module Torutsume
  module Git
    class RepositoryPathFinder
      def initialize(rails_root: _, rails_env: _)
        @rails_root = rails_root
        @rails_env  = rails_env
      end

      def find(text)
        File.join(@rails_root, 'repo', @rails_env, text.id.to_s)
      end
    end
  end
end
