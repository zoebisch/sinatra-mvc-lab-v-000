require 'pry'
class  PigLatinizer
  attr_accessor :word

  def to_pig_latin(sentence)
    sentence.split(" ").collect{|word| piglatinize(word)}.join(" ")
  end
  def piglatinize(word)
    @word = word
    if first_is_consonant?
      word_parts = @word.partition(get_vowels[0])
      platin = word_parts[1] + word_parts.last + word_parts[0] + "ay"
    elsif first_is_vowel?
      platin = @word + "way"
    end
  end

  def first_is_consonant?
      @word[0].downcase.scan(/[bcdfghjklmnpqrstvwxyz]/) != []
  end

  def get_vowels
    @word.downcase.scan(/[aeoui]/)
  end

  def first_is_vowel?
    get_vowels[0] == @word[0].downcase
  end

end

blah = PigLatinizer.new
blah.piglatinize("Cheers")
