require 'spec_helper'

describe "edicts/show" do
  before(:each) do
    @edict = assign(:edict, stub_model(Edict,
      :keys => "",
      :kanji => "",
      :kana => "",
      :defs => "",
      :edict_id => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
