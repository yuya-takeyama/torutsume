module Torutsume
  module Git
    describe RepositoryCreator do
      let(:creator) do
        RepositoryCreator.new(
          repository_class: repository_class,
          repository_path_finder: repository_path_finder,
        )
      end

      let(:repository_path_finder) do
        finder = double('finder')
        allow(finder).to receive(:find).and_return(repository_path)
        finder
      end

      let(:repository_path) { '/path/repo/1' }

      let(:text) { ::Text.new(id: 1) }

      describe '#create' do
        context 'when succeeded' do
          let(:repository_class) do
            repository_class = double('repository_class')
            allow(repository_class).to receive(:init_at)
            repository_class
          end

          it 'should create repository at expected place' do
            creator.create(text)
            expect(repository_class)
              .to have_received(:init_at)
              .with(repository_path, :bare)
          end
        end
      end
    end
  end
end
