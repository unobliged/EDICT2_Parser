class AddTextColumnForWords < ActiveRecord::Migration
  def change
		add_column :words, :keys_text, :text
  end

end
