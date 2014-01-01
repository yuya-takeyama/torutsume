module Torutsume
  module Text
    class Poster
      def initialize(texts_table: _, repository_creator: _)
        @texts_table  = texts_table
        @repo_creator = repository_creator
      end

      def post(user: _, subject: _, body: _)
        text = @texts_table.new(
          user: user,
          subject: subject,
          body: body,
        )

        @texts_table.transaction do
          begin
            raise ActiveRecord::Rollback unless text.save
            result = @repo_creator.create(text)
            raise ActiveRecord::Rollback unless result
            return PostResult.new(status: true, text: text)
          end
        end

        # persisted? to be false
        new_text = ::Text.new(
          user_id: text.user_id,
          subject: text.subject,
          body: text.body,
        )
        PostResult.new(status: false, text: new_text, error: @repo_creator.error)
      end
    end
  end
end
