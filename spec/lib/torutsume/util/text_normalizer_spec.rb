module Torutsume
  module Util
    describe TextNormalizer do
      let(:normalizer) { TextNormalizer.new }

      describe '#normalize_multiple_lines' do
        it 'should replace CRLF with LF' do
          expect(normalizer.normalize_multiple_lines("Foo\r\n")).to eq("Foo\n")
        end

        it 'should replace CR with LF' do
          expect(normalizer.normalize_multiple_lines("Foo\r")).to eq("Foo\n")
        end

        it 'should append LF end of the text if no LF there' do
          expect(normalizer.normalize_multiple_lines("Foo")).to eq("Foo\n")
        end

        it 'should remove doubled LF end of the text' do
          expect(normalizer.normalize_multiple_lines("Foo\n\n")).to eq("Foo\n")
          expect(normalizer.normalize_multiple_lines("Foo\n\n\n")).to eq("Foo\n")
        end

        it 'should not remove doubled LF except for end of the text' do
          expect(normalizer.normalize_multiple_lines("Foo\n\n\nBar\n")).to eq("Foo\n\n\nBar\n")
        end

        it 'should be nil if the input is nil' do
          expect(normalizer.normalize_multiple_lines(nil)).to be_nil
        end
      end
    end
  end
end
