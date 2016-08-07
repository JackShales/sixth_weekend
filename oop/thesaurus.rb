# Create a thesaurus application. To create it, you will create two classes, Thesaurus and Entry.
# A Thesaurus will contain many Entries. An Entry contains three primary attributes:
# word, synonymns, and antonyms. Your application should contain the following features:
# 1. The ability to add new words to a Thesaurus.
# 2. The ability to delete a word from a Thesaurus. 
# 3. The ability to look up a word's synonyms.
# 4. The ability to look up a word's antonyms.
# 5. The ability to add a synonym to a word.
# 6. The ability to add an antonym to a word.
#
# Part of the challenge is to determine which functionality belongs in the Thesaurus class,
# and which belongs in the Entry class.
#
# And... test your functionality using RSpec!

class Entry
  attr_reader :word, :synonyms, :antonyms

  def initialize(word)
    @word = word
    @synonyms = []
    @antonyms = []
  end

  def add_synonym!(synonym)
    @synonyms << synonym
  end

  def add_antonym!(antonym)
    @antonyms << antonym
  end
end

class Thesaurus
  attr_reader :entries

  def initialize
    @entries = []
  end

  def new_word(word)
    x = Entry.new(word)
    @entries << x
  end

  def delete_word(word)
    @entries.delete_if { |entry| entry.word == word }
  end
end

RSpec.describe Entry do
  describe '#initialize' do
    it 'should contain a word' do
      entry = Entry.new("sly")
      expect(entry.word).to eq("sly")
    end

    it 'should contain an empty array of synonyms' do
      entry = Entry.new("sly")
      expect(entry.synonyms).to eq([])
    end

    it 'should contain an empty array of antonyms' do
      entry = Entry.new("sly")
      expect(entry.antonyms).to eq([])
    end
  end

  describe '#add_synonym' do
    it 'should be able to add synonyms' do
      entry = Entry.new("sly")
      entry.add_synonym!("sneaky")
      expect(entry.synonyms).to eq(["sneaky"])
    end
  end

  describe '#add_antonym' do
    it 'should be able to add antonyms' do
      entry = Entry.new("sly")
      entry.add_antonym!("brash")
      expect(entry.antonyms).to eq(["brash"])
    end
  end
end

RSpec.describe Thesaurus do
  describe '#new_word' do
    it 'should start with an empty entries array' do
      th_1 = Thesaurus.new
      expect(th_1.entries).to eq([])
    end

    it 'should shovel a word into entries' do
      th_1 = Thesaurus.new
      th_1.new_word("sly")
      expect(th_1.entries[0].word).to eq("sly")
    end

    it 'should delete a word from the entries array' do
      th_1 = Thesaurus.new
      th_1.new_word("sly")
      th_1.delete_word("sly")
      expect(th_1.entries).to eq([])
    end
  end
end
