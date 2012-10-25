class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :keys
      t.text :kanji
      t.text :kana
      t.text :definitions
      t.text :edict_id

      t.timestamps
    end
  end
end
