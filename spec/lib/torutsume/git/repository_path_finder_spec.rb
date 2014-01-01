module Torutsume
  module Git
    describe RepositoryPathFinder do
      describe '#find' do
        subject { RepositoryPathFinder.new(rails_root: rails_root).find(text) }
        let(:rails_root) { '/root' }
        let(:text) { ::Text.new(id: 1) }

        it 'should return path for git repository' do
          expect(subject).to eq('/root/repo/1')
        end
      end
    end
  end
end
