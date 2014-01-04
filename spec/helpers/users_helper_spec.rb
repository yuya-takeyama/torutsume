describe UsersHelper do
  describe '#link_to_user' do
    subject { helper.link_to_user(user) }

    context 'when the user is present' do
      let(:user) { build :user }

      it 'should be link to users page' do
        expect(subject).to eq('<a href="/users/1000">testuser</a>')
      end
    end

    context 'when the user is not present' do
      let(:user) { nil }

      it 'should be text without link' do
        expect(subject).to eq('Retired User')
      end
    end
  end
end
