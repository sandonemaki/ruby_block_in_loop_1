require 'minitest/autorun'
require_relative '../lib/effects'

class EffectsTest < Minitest::Test
  def test_reverse
    effect = Effects::Reverse.new
    assert_equal 'ybuR si !nuf', effect.call('Ruby is fun!')
  end

  def test_echo
    effect = Effects::Echo.new(2)
    assert_equal 'RRuubbyy iiss ffuunn!!', effect.call('Ruby is fun!')

    effect = Effects::Echo.new(3)
    assert_equal 'RRRuuubbbyyy iiisss fffuuunnn!!!', effect.call('Ruby is fun!')
  end

  def test_loud
    effect = Effects::Loud.new(2)
    assert_equal 'RUBY!! IS!! FUN!!!', effect.call('Ruby is fun!')

    effect = Effects::Loud.new(3)
    assert_equal 'RUBY!!! IS!!! FUN!!!!', effect.call('Ruby is fun!')
  end

	def test_pitch_shift
		effect = Effects::Pitch_shift.new(0)
		assert_equal 'ABC abc 123!', effect.call('ABC abc 123!')

		effect = Effects::Pitch_shift.new(1)
		assert_equal 'BCD bcd 123!', effect.call('ABC abc 123!')

		effect = Effects::Pitch_shift.new(2)
		assert_equal 'CDE cde 123!', effect.call('ABC abc 123!')

		effect = Effects::Pitch_shift.new(-1)
		assert_equal 'ZAB zab 123!', effect.call('ABC abc 123!')

		effect = Effects::Pitch_shift.new(25)
		assert_equal 'Z z', effect.call('A a')

		effect = Effects::Pitch_shift.new(26)
		assert_equal 'A a', effect.call('A a')

		effect = Effects::Pitch_shift.new(5)
		assert_equal 'Wzgd nx kzs!', effect.call('Ruby is fun!')

		effect = Effects::Pitch_shift.new(-1)
		assert_equal 'HAL', effect.call('IBM')
	end
end
