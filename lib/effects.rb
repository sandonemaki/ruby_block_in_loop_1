module Effects
  ALPHABET = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'].freeze
  class Reverse
    def call(words)
      words.split(' ').map(&:reverse).join(' ')
    end
  end

  class Echo
    def initialize(rate)
      @rate = rate
    end

    def call(words)
      words.each_char.map { |c| c == ' ' ? c : c * @rate }.join
    end
  end

  class Loud
    def initialize(level)
      @level = level
    end

    def call(words)
      words.split(' ').map {|word| word.upcase + '!' * @level}.join(' ')
    end
  end

  class Pitch_shift
    def initialize(pitch)
      @pitch = pitch
    end

    def call(words)
      char_index =
        words.downcase.split('').map { |char|
          # 用途
          # pitch分index番号をshift
          if char.match?(/[a-z]/)
            char_num = ALPHABET.index(char) + @pitch
            if char == " "
              next
            else
              char_num % 26
            end
          end
      }

      shifted_chars =
        char_index.map { |char|
          if char == nil
            " "
          else
            ALPHABET[char.to_i]
          end
      }
      # 用途
      # 小文字->大文字に戻す
      # 大文字/小文字以外はそのまま出力
      original_chars = words.split('')
      original_chars.zip(shifted_chars).map { |x, y|
        if x.match?(/[A-Z]/)
          y.upcase
        elsif x.match?(/[^a-z]/)
          x
        else
          y
        end
      }.join
    end
  end
end

#		effect = Effects::Pitch_shift.new(0)
#    # assert_equal 'ABC abc 123!',
#		effect.call('ABC abc 123!')
#
#		effect = Effects::Pitch_shift.new(1)
#    # assert_equal 'BCD bcd 123!',
#		effect.call('ABC abc 123!')
#
#		effect = Effects::Pitch_shift.new(2)
#    # assert_equal 'CDE cde 123!',
#		effect.call('ABC abc 123!')
#
#    effect = Effects::Pitch_shift.new(-1)
#    # assert_equal 'ZAB zab 123!',
#		effect.call('ABC abc 123!')
#
#		effect = Effects::Pitch_shift.new(26)
#    # assert_equal 'A a',
#		effect.call('A a')
#
#		effect = Effects::Pitch_shift.new(5)
#		# assert_equal 'Wzgd nx kzs!',
#		effect.call('Ruby is fun!')
#
#		effect = Effects::Pitch_shift.new(-1)
#		# assert_equal 'HAL',
#		effect.call('IBM')
