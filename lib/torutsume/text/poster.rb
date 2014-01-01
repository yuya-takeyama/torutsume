module Torutsume
  module Text
    class Poster
      def initialize(texts_table: _, repository_creator: _)
        @texts_table  = texts_table
        @repo_creator = repository_creator
      end

      def create(user: _, subject: _, body: _)
        text = @texts_table.new(
          user: user,
          subject: subject,
          body: body,
        )

        @texts_table.transaction do
          begin
            raise 'Failed to save Text' unless text.save

            result = @repo_creator.create(user: user, text: text)
            raise @repo_creator.error unless result

            return PostResult.new(status: true, text: text)
          rescue => e
            @error = e
            raise ActiveRecord::Rollback.new(e)
          end
        end

        # persisted? to be false
        new_text = ::Text.new(
          user_id: text.user_id,
          subject: text.subject,
          body: text.body,
        )
        PostResult.new(status: false, text: new_text, error: @error || nil)
      end
    end
  end
end
