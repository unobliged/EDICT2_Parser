class AddIndexToWordsKeyText < ActiveRecord::Migration
  def up
    execute "CREATE INDEX trgm_gin_index_words_keys_text ON words USING GIN(keys_text gin_trgm_ops)"
  end

  def down
    execute "DROP INDEX trgm_gin_index_words_keys_text"
  end
end
