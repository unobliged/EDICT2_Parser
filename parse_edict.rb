# This is a test script for parsing EDICT2U
# A rake task will load to postgres

edict = 'edict2u'
lines = IO.readlines(edict)[165683..165690]
lines.each do |line|

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
		kanji = "No Kanji"
 		kana = line[kana_start..key_end-1].split(';')
	end

# Some keys will be abbreviations denoting things (e.g., P = common, oK = old Kanji)
# Rather than delete them, I am adding them as keys for future search functionality
# Kanji array will hold the kanji with their associated denotation
  keys = line[0, key_end].gsub(/[\[\](]/, ';').gsub(')', '').split(';').each { |key| key.strip! }

  puts line
  puts keys.to_s
	puts kanji.to_s
	puts kana.to_s

# Single definition entries do not have numbering
  if definitions.to_s.include?('(1)')
    def_hash = {}

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
      def_hash[y] = line[defs_start..defs_end]
    end

  # The first definition has the part of speech preceeding the number: (n) (1)
    def1_end = line.index('(2)')-2
    def_hash[1] = line[key_end+3..def1_end]

 	  puts def_hash
	else
		puts definitions
  end


end
