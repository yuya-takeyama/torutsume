module Torutsume
  module Text
    class Poster
      attr_reader :error

      def initialize(texts_table: _, repository_creator: _)
        @texts_table  = texts_table
        @repo_creator = repository_creator
      end

      def post(user: user, subject: subject, body: body)
        @texts_table.transaction do
          text = @texts_table.new(
            user: user,
            subject: subject,
            body: body,
          )
          text.save!
          raise @repo_creator.error unless @repo_creator.create(text)
          text
        end
      rescue => e
        @error = e
        nil
      end
    end
  end
end
