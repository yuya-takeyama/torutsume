require 'spec_helper'

describe "texts/index" do
  before(:each) do
    assign(:texts, [create(:text), create(:text)])
  end

  it "renders a list of texts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td>a", :text => "Test Subject".to_s, :count => 2
  end
end
