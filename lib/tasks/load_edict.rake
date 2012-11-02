task :load_edict => :environment do

# Reload dictionary when file updated
	Word.delete_all
	
	edict = 'edict2u'
	lines = IO.readlines(edict)[0..10000]
	lines.each do |line|
	  edict_word = Word.new
	# this tests for the dictionary version line, which is not a real entry
	  next if line.include? "EDICT2"
	
	# All entries end with a unique sequence number of the format EntLnnnnnnnnX
	  def_end = line.index('/EntL')-1
	
	# Kana entries do not have Kana keys in brackets []
	  if line.include? "["
	    kana_start = line.index('[')+1
	    key_end = line.index("]")
	    definitions = line[key_end+3..def_end]
	    kanji = line[0..kana_start-3].split(';')
	    kana = line[kana_start..key_end-1].split(';')
	  else
	    kana_start = 0
	    key_end = line.index("/")
	    definitions = line[key_end+1..def_end]
	    kanji = []
	    kana = line[kana_start..key_end-1].split(';')
	  end
	
		edict_id = line[def_end+2..line.rindex('/')-1]
	
	# Some keys will be abbreviations denoting things (e.g., P = common, oK = old Kanji)
	# Rather than delete them, I am adding them as keys for future search functionality
	# Kanji array will hold the kanji with their associated denotation
	  keys = line[0, key_end].gsub(/[\[\](]/, ';').gsub(')', '').split(';').each { |key| key.strip! }
	
	
	# Single definition entries do not have numbering
	  def_array = []
	  if definitions.to_s.include?('(1)')
	
	  # .uniq: some entries refer to definitions in the same format as they are presented:
	  # (1) (sense (1) is usually ひとめ) (a) glance/(a) look/(a) glimpse/(n)
	    num_defs = (1..definitions.scan(/(\(\d\))/).uniq.length).to_a
	
	    num_defs.each do |y|
	      defs_start = line.index("(#{y.to_s})")
	      if y == num_defs.last
	        defs_end = def_end
	      else
	        defs_end = line.index("(#{(y+1).to_s})")-2
	      end
	      def_array << line[defs_start..defs_end]
	    end
	
	  # The first definition has the part of speech preceeding the number: (n) (1)
	    def1_end = line.index('(2)')-2
	    def_array[0] = line[key_end+3..def1_end]
	  else
	    def_array << definitions
	  end

		edict_word.keys = keys
		edict_word.keys_text = keys.to_s
		edict_word.kanji = kanji
		edict_word.kana = kana
		edict_word.edict_id = edict_id
		edict_word.def_array = def_array
		edict_word.def_text = def_array.to_s
	
	#	puts edict_word.keys.to_s
	#	puts edict_word.kanji.to_s
	#	puts edict_word.kana.to_s
	#	puts edict_word.definitions.to_s
	
		edict_word.save
	end
end
