module Torutsume
  module Git
    class CommitWriter
      def initialize(index_class: _, commit_class: _)
        @index_class = index_class
        @commit_class = commit_class
      end

      def write(repository: _, user: _, text: _)
        oid   = repository.write(text.body, :blob)
        index = @index_class.new
        index.add(path: 'body.txt', oid: oid, mode: 0100644)
        @commit_class.create(repository, build_options(repository, index, user))
      end

      private
        def build_options(repository, index, user)
          options = {}

          options[:tree] = index.write_tree(repository)

          options[:author] = {email: user.email, name: 'Test Author', time: Time.now}
          options[:committer] = {email: user.email, name: 'Test Author', time: Time.now}
          options[:message] = ''
          options[:parents] = []
          options[:update_ref] = 'HEAD'

          options
        end
    end
  end
end
