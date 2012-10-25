class AddDefArrayColumnToWords < ActiveRecord::Migration
  def change
    add_column :words, :def_array, :string_array
  end
end
