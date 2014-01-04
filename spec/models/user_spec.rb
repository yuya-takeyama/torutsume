describe User do
  describe '#name_for_git' do
    subject { user.name_for_git }

    context 'when name is present' do
      let(:user) { User.new name: name }
      let(:name) { 'Test User' }

      it 'should be its name' do
        expect(subject).to eq(name)
      end
    end
  end
end
