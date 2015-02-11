require 'test_helper'

class IPV6_dump < MiniTest::Test

	def setup
		@ip6 = IP.new("2001:db8:102::10/120")
		@ip6s = "2001:db8:102::10/120"
    @ip6c = IP.new("2001:db8:102::10/120@foo")
	end

	def test_ipv6_dump_from_ip
		assert_equal "v6^2001:0db8:0102:0000:0000:0000:0000:0010^120", IPAddressSerializer.dump(@ip6)
	end

	def test_ipv6_load_to_ip
		assert_equal IP.new("2001:db8:102::10/120"), IPAddressSerializer.load("v6^2001:0db8:0102:0000:0000:0000:0000:0010^120")
	end

	def test_ipv6_dump_from_string
		assert_equal "v6^2001:0db8:0102:0000:0000:0000:0000:0010^120", IPAddressSerializer.dump(@ip6)
	end

  def test_ipv6_load_legacy_to_ip
    assert_equal IP.new("2001:db8:102::10/120"), IPAddressSerializer.load("v6^20010db8010200000000000000000010^120")
  end

  def test_ipv6_context_dump_from_ip
    assert_equal "v6^2001:0db8:0102:0000:0000:0000:0000:0010^120^%foo", IPAddressSerializer.dump(@ip6c)
  end

  def test_ipv6_context_load_to_ip
    assert_equal IP.new("2001:db8:102::10/120@foo"), IPAddressSerializer.load("v6^2001:0db8:0102:0000:0000:0000:0000:0010^120^%foo")
  end

  def test_ipv6_format_upgrade_v1_to_v2
    assert_equal "v6^2001:0db8:0102:0000:0000:0000:0000:0010^120", IPAddressSerializer.dump(IPAddressSerializer.load("v6^20010db8010200000000000000000010^120"))
  end
end
