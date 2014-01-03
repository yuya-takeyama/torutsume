require 'spec_helper'

describe "texts/index" do
  before(:each) do
    assign(:texts, [
      stub_model(Text,
        :user => build(:user),
        :subject => "Subject",
        :body => "MyText"
      ),
      stub_model(Text,
        :user => build(:user),
        :subject => "Subject",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of texts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
  end
end
