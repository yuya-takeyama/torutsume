module Torutsume
  module Text
    class Poster
      def initialize(texts_table: _, repository_writer: _)
        @texts_table = texts_table
        @repository_writer = repository_writer
      end

      def create(user: _, params: _)
        text = @texts_table.new(
          user: user,
          subject: params[:subject],
          body: params[:body],
        )

        @texts_table.transaction do
          begin
            raise 'Failed to save Text' unless text.save

            result = @repository_writer.create(user: user, text: text)
            raise @repository_writer.error unless result

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

      def update(user: _, text: _, params: _, message: nil)
        @texts_table.transaction do
          begin
            raise 'Failed to update Text' unless text.update(params)

            result = @repository_writer.update(user: user, text: text, message: message)
            raise @repository_writer.error unless result

            return PostResult.new(status: true, text: text)
          rescue => e
            @error = e
            raise ActiveRecord::Rollback.new(e)
          end
        end

        PostResult.new(status: false, text: text, error: @error || nil)
      end
    end
  end
end
