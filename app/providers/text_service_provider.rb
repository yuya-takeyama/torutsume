class TextServiceProvider < Dee::Rails::ServiceProvider
  provide do
    singleton 'text.poster' do
      Torutsume::Text::Poster.new(
        texts_table: Text,
        repository_writer: self['git.repository_writer'],
      )
    end
  end
end
