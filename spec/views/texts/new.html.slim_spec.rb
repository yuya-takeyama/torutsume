require 'spec_helper'

describe "texts/new" do
  before(:each) do
    assign(:text, stub_model(Text,
      :user => nil,
      :subject => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new text form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", texts_path, "post" do
      assert_select "input#text_subject[name=?]", "text[subject]"
      assert_select "textarea#text_body[name=?]", "text[body]"
    end
  end
end
