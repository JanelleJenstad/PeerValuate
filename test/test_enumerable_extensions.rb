require "test/unit"
require_relative "../extension/enumerable_ext"

class TestEnumerableExtensions < Test::Unit::TestCase
	def test_single
		assert_equal('a', ['a'].single)
		assert_equal('a', ['a', 'b'].single {|item| item == 'a'})
		assert_raise(RuntimeError) {['a', 'b'].single}
		assert_raise(RuntimeError) {['a'].single {|item| item == 'b'}}
	end

	def test_single_or_default
		assert_equal('a', ['a'].singleOrDefault)
		assert_equal(nil, [].singleOrDefault)
		assert_equal('a', ['a','b'].singleOrDefault {|item| item == 'a'})
		assert_raise(RuntimeError) {['a','b'].singleOrDefault}
	end
end
