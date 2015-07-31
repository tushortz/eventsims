#require "./test_helper"

require File.dirname(__FILE__) + '/./test_helper'
class EventsimsTest < Test::Unit::TestCase
	def test_version
		assert_equal "0.0.1", Eventsims::VERSION
	end
end

