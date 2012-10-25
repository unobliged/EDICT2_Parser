require 'spec_helper'

describe "edicts/edit" do
  before(:each) do
    @edict = assign(:edict, stub_model(Edict,
      :keys => "",
      :kanji => "",
      :kana => "",
      :defs => "",
      :edict_id => "MyText"
    ))
  end

  it "renders the edit edict form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => edicts_path(@edict), :method => "post" do
      assert_select "input#edict_keys", :name => "edict[keys]"
      assert_select "input#edict_kanji", :name => "edict[kanji]"
      assert_select "input#edict_kana", :name => "edict[kana]"
      assert_select "input#edict_defs", :name => "edict[defs]"
      assert_select "textarea#edict_edict_id", :name => "edict[edict_id]"
    end
  end
end
