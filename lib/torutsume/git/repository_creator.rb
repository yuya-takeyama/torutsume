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
        user = text.user

        begin
          repo  = @repository_class.init_at(path, :bare)
          oid   = repo.write(text.body, :blob)
          index = Rugged::Index.new
          index.add(path: 'body.txt', oid: oid, mode: 0100644)

          options = {}

          options[:tree] = index.write_tree(repo)

          options[:author] = {email: user.email, name: 'Test Author', time: Time.now}
          options[:committer] = {email: user.email, name: 'Test Author', time: Time.now}
          options[:message] = ''
          options[:parents] = []
          options[:update_ref] = 'HEAD'

          Rugged::Commit.create(repo, options)

          repo
        rescue => e
          @error = e
          nil
        end
      end
    end
  end
end
