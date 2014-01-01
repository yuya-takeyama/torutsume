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
        subject { creator.create(text) }

        context 'when succeeded' do
          let(:repository_class) do
            repository_class = double('repository_class')
            allow(repository_class).to receive(:init_at).and_return(repository)
            repository_class
          end

          let(:repository) { double(Rugged::Repository) }

          it 'should create repository at expected place' do
            expect(subject).to be_equal(repository)
            expect(repository_class)
              .to have_received(:init_at)
              .with(repository_path, :bare)
          end
        end

        context 'when failed' do
          let(:repository_class) do
            repository_class = double('repository_class')
            allow(repository_class).to receive(:init_at).and_raise(error)
            repository_class
          end

          let(:error) { StandardError.new 'Some error occured' }

          it 'should create repository at expected place' do
            expect(subject).to be_nil
            expect(repository_class)
              .to have_received(:init_at)
              .with(repository_path, :bare)
            expect(creator.error).to be_equal(error)
          end
        end
      end
    end
  end
end
