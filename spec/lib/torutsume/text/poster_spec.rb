module Torutsume
  module Text
    describe Poster do


      let(:poster) do
        Poster.new(
          texts_table: ::Text,
          repository_creator: repository_creator,
        )
      end

      let(:user) { User.new(id: 1) }

      describe '#post' do
        subject { poster.post(user: user, subject: 'Subject', body: 'Body') }

        context 'when succeeded' do
          let(:repository_creator) do
            repository_creator = double('repository_creator')
            allow(repository_creator).to receive(:create).and_return(true)
            repository_creator
          end

          it 'should be ok result' do
            expect(subject).to be_ok
            expect(subject.text.subject).to eq('Subject')
            expect(subject.text.body).to eq('Body')
            expect(subject.text).to be_persisted
            expect(::Text.count).to eq(1)
          end
        end

        context 'when failed' do
          let(:repository_creator) do
            repository_creator = double('repository_creator')
            allow(repository_creator).to receive(:create).and_return(false)
            allow(repository_creator).to receive(:error).and_return(error)
            repository_creator
          end

          let(:error) { StandardError.new 'Some error occured' }

          it 'should be error result' do
            expect(subject).to be_error
            expect(subject.text.subject).to eq('Subject')
            expect(subject.text.body).to eq('Body')
            expect(subject.text).to_not be_persisted
            expect(subject.error.message).to eq('Some error occured')
            expect(::Text.count).to eq(0)
          end
        end
      end
    end
  end
end
