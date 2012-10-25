class AddIndexToWordsDefArray < ActiveRecord::Migration
	def up
    execute "CREATE INDEX gin_index_words_def_array ON words USING GIN(def_array)"
  end

  def down
    execute "DROP INDEX gin_index_words_def_array"
  end
end
