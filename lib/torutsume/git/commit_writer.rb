module Torutsume
  module Git
    class CommitWriter
      def initialize(index_class: _, commit_class: _)
        @index_class = index_class
        @commit_class = commit_class
      end

      def write(repository: _, user: _, text: _, message: nil, initial: false)
        oid   = repository.write(text.body, :blob)
        index = @index_class.new
        index.add(path: 'body.txt', oid: oid, mode: 0100644)
        options = build_options(repository, index, user, message, initial)
        @commit_class.create(repository, options)
      end

      private
        def build_options(repository, index, user, message, initial)
          options = {}

          options[:tree] = index.write_tree(repository)

          options[:author] = {email: user.email, name: user.name_for_git, time: Time.now}
          options[:committer] = {email: user.email, name: user.name_for_git, time: Time.now}
          options[:message] = initial ? 'Initial commit' : (message || '')
          options[:parents] = repository.empty? ? [] : [repository.head.target].compact
          options[:update_ref] = 'HEAD'

          options
        end
    end
  end
end
