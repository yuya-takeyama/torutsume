module Torutsume
  module Git
    describe RepositoryPathFinder do
      describe '#find' do
        subject { RepositoryPathFinder.new(rails_root: rails_root, rails_env: rails_env).find(text) }
        let(:rails_root) { '/root' }
        let(:rails_env) { 'test' }
        let(:text) { ::Text.new(id: 1) }

        it 'should return path for git repository' do
          expect(subject).to eq('/root/repo/test/1')
        end
      end
    end
  end
end
