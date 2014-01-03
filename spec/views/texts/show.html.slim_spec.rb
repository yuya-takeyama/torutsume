require 'spec_helper'

describe "texts/show" do
  before(:each) do
    @text = assign(:text, stub_model(Text,
      :user => build(:user),
      :subject => "Subject",
      :body => "MyText"
    ))
    @torutsume_text = assign(:torutsume_text, ::Torutsume::Text::Text.new(lines: []))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
  end
end
