require 'test_helper'

class IPV6_dump < MiniTest::Test

	def setup
		@ip6 = IP.new("2001:db8:102::10/120")
		@ip6s = "2001:db8:102::10/120"
	end

	def test_ipv6_dump_from_ip
		assert_equal "v6^20010db8010200000000000000000010^120", IPAddressSerializer.dump(@ip6)
	end

	def test_ipv6_load_to_ip
		assert_equal IP.new("2001:db8:102::10/120"), IPAddressSerializer.load("v6^20010db8010200000000000000000010^120")
	end
	
	def test_ipv6_dump_from_string
		assert_equal "v6^20010db8010200000000000000000010^120", IPAddressSerializer.dump(@ip6)
	end
		
end