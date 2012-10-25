class Word < ActiveRecord::Base
  attr_accessible :edict_id, :kana, :kanji, :keys, :keys_text, :def_array, :def_text
	serialize :keys, Array
	serialize :kanji, Array
	serialize :kana, Array

	after_initialize :add_empty_array, :add_empty_string

	def add_empty_array
    self.def_array ||= []
  end

	def add_empty_string
    self.keys_text ||= ""
    self.def_text ||= ""
  end
end
