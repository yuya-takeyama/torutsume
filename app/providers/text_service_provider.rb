class TextServiceProvider < Dee::Rails::ServiceProvider
  provide do
    singleton 'text.poster' do
      Torutsume::Text::Poster.new(
        texts_table: Text,
        repository_writer: self['git.repository_writer'],
      )
    end

    singleton 'text.text_loader' do
      Torutsume::Text::TextLoader.new(
        repository_loader: self['git.repository_loader'],
        blame_loader: self['git.blame_loader'],
        comment_class: Comment,
      )
    end
  end
end
