describe User do
  describe '#name_for_git' do
    subject { user.name_for_git }
    let(:user) { User.new username: username, name: name }
    let(:username) { 'testuser' }

    context 'when name is present' do
      let(:name) { 'Test User' }

      it 'should be its name' do
        expect(subject).to eq(name)
      end
    end

    context 'when name is nil' do
      let(:name) { nil }

      it 'should be its username' do
        expect(subject).to eq(username)
      end
    end

    context 'when name is empty' do
      let(:name) { '' }

      it 'should be its username' do
        expect(subject).to eq(username)
      end
    end
  end
end
