class TextServiceProvider < Dee::Rails::ServiceProvider
  provide do
    singleton 'text.poster' do
      Torutsume::Text::Poster.new(
        texts_table: Text,
        repository_creator: self['git.repository_creator'],
      )
    end
  end
end
