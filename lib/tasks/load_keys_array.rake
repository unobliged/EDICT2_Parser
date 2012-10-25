#task :load_keys_array => :environment do
#
## Reload dictionary when file updated
#
# edict = 'edict2u'
# lines = IO.readlines(edict)
# lines.each do |line|
#   edict_word = Word.new
# # this tests for the dictionary version line, which is not a real entry
#   next if line.include? "EDICT2"
#
# # Kana entries do not have Kana keys in brackets []
#   if line.include? "["
#     key_end = line.index("]")
#   else
#     key_end = line.index("/")
#   end
#
#   keys = line[0, key_end].gsub(/[\[\](]/, ';').gsub(')', '').split(';').each { |key| key.strip! }
#
#   edict_word.keys_array = keys
#
#   edict_word.save
# end
#end
#
