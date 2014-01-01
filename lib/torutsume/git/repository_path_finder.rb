module Torutsume
  module Git
    class RepositoryPathFinder
      def initialize(rails_root: rails_root)
        @rails_root = rails_root
      end

      def find(text)
        File.join(@rails_root, 'repo', text.id.to_s)
      end
    end
  end
end
