require 'test/unit'

class TestAdd < Test::Unit::TestCase
	def test_add
		calc = Calc.new
		expected = calc.add(3,2)
		assert_equal(expected, 5)
	end
end

class Calc
	def add(*arg)
		arg.inject(:+)
	end
end
