require 'spec_helper'

describe "edicts/index" do
  before(:each) do
    assign(:edicts, [
      stub_model(Edict,
        :keys => "",
        :kanji => "",
        :kana => "",
        :defs => "",
        :edict_id => "MyText"
      ),
      stub_model(Edict,
        :keys => "",
        :kanji => "",
        :kana => "",
        :defs => "",
        :edict_id => "MyText"
      )
    ])
  end

  it "renders a list of edicts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
