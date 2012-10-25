class AddPgTrgm < ActiveRecord::Migration
	def self.up
    execute "CREATE EXTENSION IF NOT EXISTS pg_trgm"
  end

  def self.down
    execute "DROP EXTENSION IF EXISTS pg_trgm"
  end
end
