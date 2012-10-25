class AddDefTextColumnToWords < ActiveRecord::Migration
  def change
    add_column :words, :def_text, :text
  end
end
