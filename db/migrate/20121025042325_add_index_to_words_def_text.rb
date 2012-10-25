class AddIndexToWordsDefText < ActiveRecord::Migration
  def up
    execute "CREATE INDEX trgm_gin_index_words_def_text ON words USING GIN(def_text gin_trgm_ops)"
  end

  def down
    execute "DROP INDEX trgm_gin_index_words_def_text"
  end
end
