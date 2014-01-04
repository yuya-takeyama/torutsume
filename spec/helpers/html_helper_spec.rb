describe HtmlHelper do
  describe '#nl2br' do
    it 'should replace line-break with <br>' do
      expect(helper.nl2br("foo\r\nbar")).to eq('foo<br>bar')
      expect(helper.nl2br("foo\rbar")).to eq('foo<br>bar')
      expect(helper.nl2br("foo\nbar")).to eq('foo<br>bar')
    end
  end

  describe '#nl2br_h' do
    it 'should replace line-break with <br> and escape tags' do
      expect(helper.nl2br_h("foo\r\nbar<")).to eq('foo<br>bar&lt;')
      expect(helper.nl2br_h("foo\rbar<")).to eq('foo<br>bar&lt;')
      expect(helper.nl2br_h("foo\nbar<")).to eq('foo<br>bar&lt;')
    end
  end

end
